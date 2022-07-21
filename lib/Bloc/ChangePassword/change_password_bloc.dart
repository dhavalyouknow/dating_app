import 'package:bloc/bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:equatable/equatable.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState>
    with BaseHttpService {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) {});
    on<VerifyPassword>(_onVerifyPassword);
    on<UpdatePassword>(_onUpdatePassword);
  }

  _onVerifyPassword(
      VerifyPassword event, Emitter<ChangePasswordState> emit) async {
    try {
      var resp = await post(
        url: ApiEndPoints.verifyPassword,
        body: {
          "password": event.password,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.statusCode);
          print(resp.body);
          event.onSuccess('success');
        } else {
          print(resp.body);
          print(resp.statusCode);
        }
      } else {}
    } catch (e) {
      print(e);
      print('--verify_password--');
    }
  }

  _onUpdatePassword(
      UpdatePassword event, Emitter<ChangePasswordState> emit) async {
    try {
      var resp = await post(
        url: ApiEndPoints.updatePassword,
        body: {
          "currentPassword": event.currentPassword,
          "newPassword": event.newPassword,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          event.onSuccess('success');
        } else {
          print(resp.body);
          print(resp.statusCode);
        }
      } else {}
    } catch (e) {
      print(e);
      print('---update_password---');
    }
  }
}
