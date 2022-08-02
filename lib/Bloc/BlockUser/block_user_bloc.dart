import 'dart:convert';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'block_user_event.dart';
part 'block_user_state.dart';

class BlockUserBloc extends Bloc<BlockUserEvent, BlockUserState>
    with BaseHttpService {
  BlockUserBloc() : super(BlockUserInitial()) {
    on<BlockUserEvent>((event, emit) {});
    on<BLockUserRequest>(_onBLockUserRequest);
  }
  _onBLockUserRequest(
    BLockUserRequest event,
    Emitter<BlockUserState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlockUserStatus.loading));
      var resp = await post(
        url: "${ApiEndPoints.blockUser}/${event.myUserId}/block",
        body: {
          "userId": event.reportUserId,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(resp.body);

          event.success();
          emit(state.copyWith(status: BlockUserStatus.success));
        } else {
          print(resp.statusCode);
          print(resp.body);
          emit(state.copyWith(status: BlockUserStatus.failure));
        }
      } else {
        print(resp);
        print(resp?.statusCode);
        emit(state.copyWith(status: BlockUserStatus.failure));
      }
    } catch (e) {
      print(e);
    }
  }
}
