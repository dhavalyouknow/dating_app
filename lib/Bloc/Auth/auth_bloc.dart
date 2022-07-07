import 'dart:async';
import 'dart:convert';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with BaseHttpService {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignUpRequest>(_onSignUpRequest);
    on<LoginRequest>(_onLoginRequest);
  }

  Future<void> _onSignUpRequest(       //For Signup
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
        },
      );
      if (kDebugMode) {
        print(resp?.statusCode);
        print(resp?.body);
        print('0=0=0=0=0=0=0=0=0');
        print(resp?.headers);
        print('0=0=0=0=0=0=0=0=0');
      }

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

  Future<void> _onLoginRequest(     // For Login
    LoginRequest event,
    Emitter<AuthState> emit,
  ) async {
    try {
      var resp = await post(
        url: ApiEndPoints.login,
        body: {
          "userName": event.userName,
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
          event.success(user);
          if (kDebugMode) {
            print(resp.body);
            print(resp.statusCode);
          }
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
        print(e);
        print('------------login error---------');
      }
    }
  }
}
