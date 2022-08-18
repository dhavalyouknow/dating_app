import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with BaseHttpService {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<UpdateUserEvent>(_onUpdateUserEvent);
    on<SetUser>(_onSetUser);
    on<SetUserInitial>(_serUserInitial);
    on<ResendEmail>(_resendEmail);
  }

  _serUserInitial(SetUserInitial event, Emitter<UserState> emit) {
    emit(state.copyWith(status: UserStatus.initial));
  }

  _onUpdateUserEvent(UpdateUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));
      Map<String, dynamic> payload = event.user.toJson();

      payload.removeWhere((key, value) =>
          value == null ||
          key == "_id" ||
          key == "userType" ||
          key == "googleId" ||
          key == "googleLogin" ||
          key == "facebookId" ||
          key == "facebookLogin" ||
          key == "appleId" ||
          key == "appleLogin" ||
          key == "eventId" ||
          key == "ticketId");
      var resp = await patch(
        url: '${ApiEndPoints.updateUser}${event.user.id}',
        body: payload,
      );

      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          Map<String, dynamic> data = jsonDecode(resp.body);
          User user = User.fromJson(data);

          event.success('success');
          emit(state.copyWith(status: UserStatus.success, user: event.user));
        } else {
          print(resp.body);
          print(resp.statusCode);
          event.onError();
          emit(state.copyWith(status: UserStatus.failure));
        }
      } else {
        print(resp?.statusCode);
        event.onError();
        emit(state.copyWith(status: UserStatus.failure));
      }
    } catch (e) {
      print(e);
      print('update-user-----');
    }
  }

  _onSetUser(SetUser event, Emitter<UserState> emit) async {
    emit(
      state.copyWith(
        status: UserStatus.success,
        user: event.user,
      ),
    );
  }

  _resendEmail(ResendEmail event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));
      var resp =
          await post(url: ApiEndPoints.resendEmail, body: {}, customHeader: {
        "authorization": event.headerToken,
      });
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.statusCode);
          print(resp.body);
          event.onSuccess();
          emit(state.copyWith(status: UserStatus.success));
        } else {
          print(resp.statusCode);
          print(resp.body);
          event.onError();
          emit(state.copyWith(status: UserStatus.failure));
        }
      } else {
        emit(state.copyWith(status: UserStatus.failure));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(status: UserStatus.failure));
    }
  }
}
