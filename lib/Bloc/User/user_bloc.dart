import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with BaseHttpService {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<UpdateUserEvent>(_onUpdateUserEvent);
    on<SetUser>(_onSetUser);
    on<SetUserInitial>(_serUserInitial);
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
          key == "email" ||
          key == "userType" ||
          key == "googleId" ||
          key == "googleLogin" ||
          key == "facebookId" ||
          key == "facebookLogin" ||
          key == "appleId" ||
          key == "appleLogin");
      var resp = await patch(
        url: '${ApiEndPoints.updateUser}${event.user.id}',
        body: payload,
      );
      print("+++++++++++++++");
      print(resp?.body);
      print(resp?.statusCode);
      print('payload ===> $payload');

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
          emit(state.copyWith(status: UserStatus.failure));
        }
      } else {
        print(resp?.statusCode);
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
}
