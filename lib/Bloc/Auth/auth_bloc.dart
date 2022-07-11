import 'dart:async';
import 'dart:convert';
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
  }

  Future<void> _onDuplicateEvent(
      DuplicateEvent event, Emitter<AuthState> emit) async {
    try {
      var resp =
          await post(url: ApiEndPoints.duplicate, body: {"email": event.email});
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          event.onSuccess();
          Fluttertoast.showToast(msg: 'Valid Email');
        } else {
          print(resp.body);
          print(resp.statusCode);
        }
      } else {}
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

          if (kDebugMode) {
            print('=1=1=1=1=1=1=1');
            print(token);
            print(resp.headers["x-auth-token"]);
            print(id);
            print('=1=1=1=1=1=1=1');
          }

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

          event.success(user);
          Fluttertoast.showToast(msg: 'SignUp Successfully');
        } else {
          if (kDebugMode) {
            print(resp.statusCode);
            print(resp.body);
          }
        }
      } else {
        if (kDebugMode) {
          print(resp?.statusCode);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('-------------sign up error-------------');
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

          emit(
            state.copyWith(
              status: AuthStatus.loginSuccess,
              token: resp.headers["x-auth-token"],
            ),
          );

          User user = User.fromJson(data);
          print('Bloc.Auth.user ===> $user');
          event.success(user);
          Fluttertoast.showToast(msg: 'Login Successfully');
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
          print(resp?.statusCode);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('object');
        print(e);
        print('------------login error---------');
      }
    }
  }

  Future<void> _onSessionRequest(
      SessionRequest event, Emitter<AuthState> emit) async {
    try {
      var res = await get(url: ApiEndPoints.getUser);
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
}
