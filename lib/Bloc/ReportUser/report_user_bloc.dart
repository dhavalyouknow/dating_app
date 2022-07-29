import 'dart:async';
import 'dart:convert';

import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'report_user_event.dart';
part 'report_user_state.dart';

class ReportUserBloc extends Bloc<ReportUserEvent, ReportUserState>
    with BaseHttpService {
  ReportUserBloc() : super(ReportUserInitial()) {
    on<ReportUserEvent>((event, emit) {});
    on<ReportUserRequest>(_onReportUserRequest);
  }

  Future<void> _onReportUserRequest(
    ReportUserRequest event,
    Emitter<ReportUserState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ReportUserStatus.loading));
      var resp = await post(
        url: ApiEndPoints.reportUser,
        body: {
          "userId": event.userId,
          "reportBy": event.reportBy,
          "reason": event.reason,
          "message": event.message,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(resp.body);

          emit(state.copyWith(status: ReportUserStatus.success));
          User user = User.fromJson(data);

          event.success(user);
          Fluttertoast.showToast(msg: 'User Reported Successfully');
        } else {
          print(resp.statusCode);
          print(resp.body);
          emit(state.copyWith(status: ReportUserStatus.failure));
        }
      } else {
        print(resp);
        emit(state.copyWith(status: ReportUserStatus.failure));
      }
    } catch (e) {
      print(e);
    }
  }
}
