import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/forgotpassword.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState>
    with BaseHttpService {
  ForgotPasswordBloc() : super(const ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) {});
    on<ForgotPwdRequest>(_onForgotPwdRequest);
  }

  _onForgotPwdRequest(
    ForgotPwdRequest event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ForgotStatus.loading));

      var resp = await post(
        url: ApiEndPoints.forgotPassword,
        body: {
          "email": event.email,
        },
      );

      if (resp != null) {
        if (resp.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(resp.body);
          emit(state.copyWith(status: ForgotStatus.success));
          event.onSuccess();
        } else {
          print(resp.body);
          print(resp.statusCode);
          print('2222222');
          Map<String, dynamic> data = jsonDecode(resp.body);
          Fluttertoast.showToast(msg: data["message"]);
          emit(state.copyWith(status: ForgotStatus.failure));
        }
      } else {
        Fluttertoast.showToast(msg: 'Something Went Wrong');
        emit(state.copyWith(status: ForgotStatus.failure));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Fluttertoast.showToast(msg: 'Something Went Wrong');
      emit(state.copyWith(status: ForgotStatus.failure));
    }
  }
}
