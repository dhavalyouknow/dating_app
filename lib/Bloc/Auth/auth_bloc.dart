import 'dart:async';
import 'dart:convert';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with BaseHttpService {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignUpRequest>(_onSignUpRequest);
    on<LoginRequest>(_onLoginRequest);
    on<DuplicateEvent>(_onDuplicateEvent);
    on<SessionRequest>(_onSessionRequest);
    on<SetLoginInitial>(_onLoginInitial);
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<LoginWithFacebook>(_onLoginWithFacebook);
    on<LoginWithApple>(_onLoginWithApple);
  }

  Future<void> _onLoginInitial(
    SetLoginInitial event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AuthStatus.initial,
      ),
    );
  }

  Future<void> _onDuplicateEvent(
      DuplicateEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      var resp = await post(
        url: ApiEndPoints.duplicate,
        body: {"email": event.email},
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          event.onSuccess();
          emit(state.copyWith(status: AuthStatus.loginSuccess));
          Fluttertoast.showToast(msg: 'Valid Email');
        } else {
          print(resp.body);
          print(resp.statusCode);
          emit(state.copyWith(status: AuthStatus.loginFailure));
        }
      } else {
        emit(state.copyWith(status: AuthStatus.loginFailure));
        print(resp?.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onSignUpRequest(
    //For Signup
    SignUpRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
      ),
    );

    try {
      if (kDebugMode) {
        print('==================');
      }
      emit(state.copyWith(status: AuthStatus.loading));
      var resp = await post(
        url: ApiEndPoints.signUp,
        body: {
          "firstName": event.name,
          "lastName": event.surname,
          "email": event.email,
          "gender": event.gender,
          "dob": event.dob,
          "password": event.password,
          "city": event.location,
        },
      );

      if (resp != null) {
        if (resp.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(resp.body);
          var token = resp.headers["x-auth-token"];
          var id = data["_id"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('auth_token', token!);
          prefs.setString('user_id', id);

          emit(
            state.copyWith(
              status: AuthStatus.loginSuccess,
              token: resp.headers["x-auth-token"],
            ),
          );

          if (kDebugMode) {
            print(resp.statusCode);
            print(resp.body);
          }

          User user = User.fromJson(data);
          emit(state.copyWith(status: AuthStatus.loginSuccess));
          event.success(user);
          Fluttertoast.showToast(msg: 'SignUp Successfully');
        } else {
          if (kDebugMode) {
            print(resp.statusCode);
            print(resp.body);
          }

          event.onError();

          emit(state.copyWith(status: AuthStatus.loginFailure));
        }
      } else {
        if (kDebugMode) {
          emit(state.copyWith(status: AuthStatus.loginFailure));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('-------------sign up error-------------');
        emit(state.copyWith(status: AuthStatus.loginFailure));
        print(e);
      }
    }
  }

  Future<void> _onLoginRequest(
    // For Login

    LoginRequest event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      var resp = await post(
        url: ApiEndPoints.login,
        body: {
          "email": event.email,
          "password": event.password,
          "pushToken": event.pushToken,
        },
      );

      if (resp != null) {
        if (resp.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(resp.body);

          var token = resp.headers["x-auth-token"];
          var id = data["_id"];

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('auth_token', token!);
          prefs.setString('user_id', id);

          User user = User.fromJson(data);
          event.success(user);
          emit(state.copyWith(status: AuthStatus.loginSuccess));
          Fluttertoast.showToast(msg: 'Login Successfully');
          emit(
            state.copyWith(
              status: AuthStatus.loginSuccess,
              token: resp.headers["x-auth-token"],
              user: User.fromJson(data),
            ),
          );
          if (kDebugMode) {
            print(resp.body);
            print(resp.statusCode);
          }
        } else {
          if (kDebugMode) {
            print(resp.statusCode);
            print(resp.body);
          }
          Fluttertoast.showToast(msg: 'Invalid Username or Password');
        }
      } else {
        if (kDebugMode) {
          Fluttertoast.showToast(msg: 'Something Went Wrong');
          emit(state.copyWith(status: AuthStatus.loginFailure));
          print(resp?.statusCode);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        Fluttertoast.showToast(msg: 'Something Went Wrong');
        emit(state.copyWith(status: AuthStatus.loginFailure));
        print('object');
        print(e);
        print('------------login error---------');
      }
    }
  }

  Future<void> _onSessionRequest(
    SessionRequest event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      var res = await get(url: ApiEndPoints.getUser);
      print(ApiEndPoints.getUser);
      if (res != null) {
        print(res.body);
        print(res.statusCode);
        if (res.statusCode == 200) {
          var data = jsonDecode(res.body);
          User user = User.fromJson(data);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String token = prefs.getString('auth_token') as String;
          event.onSuccess(user);

          emit(
            state.copyWith(
              status: AuthStatus.loginSuccess,
              token: token,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: AuthStatus.loginFailure,
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.loginFailure,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print('--session--');
      }
      emit(
        state.copyWith(
          status: AuthStatus.loginFailure,
        ),
      );
    }
  }

  Future<void> _onLoginWithGoogle(
      LoginWithGoogle event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      var resp = await post(
        url: ApiEndPoints.loginWithGoogle,
        body: {
          "email": event.email,
          "googleId": event.googleId,
          "pushToken": event.pushToken,
        },
        customHeader: {
          "Google-Id-Token": event.fcmtoken,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          var _token = resp.headers["x-auth-token"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('auth_token', _token!);
          Map<String, dynamic> data = jsonDecode(resp.body);
          User user = User.fromJson(data);
          event.isRegistered(data["isRegistered"]);
          event.onSuccess(user);
          print(resp.statusCode);
          print(resp.body);
          emit(state.copyWith(
              status: AuthStatus.loginSuccess, user: User.fromJson(data)));
        } else {
          print(resp.body);
          print(resp.statusCode);
          event.onError();
          emit(state.copyWith(status: AuthStatus.loginFailure));
        }
      } else {
        emit(state.copyWith(status: AuthStatus.loginFailure));
      }
    } catch (e) {
      print(e);
      print('-----login with google');
      emit(state.copyWith(status: AuthStatus.loginFailure));
    }
  }

  Future<void> _onLoginWithFacebook(
      LoginWithFacebook event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      var resp = await post(
        url: ApiEndPoints.loginWithFacebook,
        body: {
          "email": event.email,
          "facebookId": event.facebookId,
          "pushToken": event.pushToken,
        },
        customHeader: {
          "fb-id-token": event.headerToken,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          var _token = resp.headers["x-auth-token"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('auth_token', _token!);
          Map<String, dynamic> data = jsonDecode(resp.body);
          User user = User.fromJson(data);
          event.onSuccess(user);
          event.isRegistered(data["isRegistered"]);
          print(resp.body);
          print(resp.statusCode);
          emit(state.copyWith(
              status: AuthStatus.loginSuccess, user: User.fromJson(data)));
        } else {
          print(resp.body);
          print(resp.statusCode);
          Map<String, dynamic> data = jsonDecode(resp.body);
          event.onError(data["error"]);
          emit(state.copyWith(status: AuthStatus.loginFailure));
        }
      } else {
        emit(state.copyWith(status: AuthStatus.loginFailure));
      }
    } catch (e) {
      print(e);
      print('login-with-facebook');
      emit(state.copyWith(status: AuthStatus.loginFailure));
    }
  }

  Future<void> _onLoginWithApple(
      LoginWithApple event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      var resp = await post(
        url: ApiEndPoints.loginWithApple,
        body: {
          "email": event.email,
          "appleId": event.appleId,
          "pushToken": event.pushToken
        },
        customHeader: {
          "apple-id-token": event.headerToken,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          var _token = resp.headers["x-auth-token"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('auth_token', _token!);
          Map<String, dynamic> data = jsonDecode(resp.body);
          User user = User.fromJson(data);
          event.isRegistered(data["isRegistered"]);
          event.onSuccess(user);
        } else {
          if (resp.statusCode == 500) {
            Fluttertoast.showToast(
                msg: "Something happened wrong try again after sometime.");
          }
          emit(state.copyWith(status: AuthStatus.loginFailure));
          print(resp.body);
          print(resp.statusCode);
        }
      } else {
        emit(state.copyWith(status: AuthStatus.loginFailure));
      }
    } catch (e) {
      print(e);
      print('-----login-with-apple-----');
    }
  }
}
