import 'dart:convert';

import 'package:dating_app/Bloc/Swipe/swipe_state.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/swipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'swipe_event.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> with BaseHttpService {
  SwipeBloc() : super(const SwipeInitial()) {
    on<SwipeEvent>((event, emit) {});
    on<GetSwipeList>(_onGetSwipeList);
    on<DisLikePerson>(_onDisLikePerson);
    on<LikePerson>(_onLikePerson);
  }

  _onGetSwipeList(GetSwipeList event, Emitter<SwipeState> emit) async {
    try {
      emit(state.copyWith(status: SwipeStatus.loading));
      var resp =
          await get(url: ApiEndPoints.swipe(event.pageNo, event.limitNo));
      print(ApiEndPoints.swipe);
      if (resp != null) {
        if (resp.statusCode == 200) {
          // print(resp.statusCode);
          // print(resp.body);
          dynamic result = jsonDecode(resp.body);
          List<Swipe> swipes = [];
          for (dynamic json in result) {
            swipes.add(Swipe.fromJson(json));
          }

          emit(state.copyWith(status: SwipeStatus.success, swipe: swipes));
        } else {
          print(resp.body);
          print(resp.statusCode);
          emit(state.copyWith(status: SwipeStatus.failure));
        }
      } else {
        print(resp!.statusCode);
        emit(state.copyWith(status: SwipeStatus.failure));
      }
    } catch (e) {
      print(e);
      print('--get--swiper---');
      emit(state.copyWith(status: SwipeStatus.failure));
    }
  }

  _onDisLikePerson(DisLikePerson event, Emitter<SwipeState> emit) async {
    try {
      emit(state.copyWith(status: SwipeStatus.loading));
      var resp = await post(
        url: '${ApiEndPoints.disLikePerson}${event.userId}',
        body: {
          "userId": event.swipeUserId,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          event.onSuccess('success');
          emit(state.copyWith(status: SwipeStatus.success));
        } else {
          print(resp.body);
          print(resp.statusCode);
          emit(state.copyWith(status: SwipeStatus.failure));
        }
      } else {
        emit(state.copyWith(status: SwipeStatus.failure));
      }
    } catch (e) {
      print(e);
      print('dislike----');
      emit(state.copyWith(status: SwipeStatus.failure));
    }
  }

  _onLikePerson(LikePerson event, Emitter<SwipeState> emit) async {
    try {
      emit(state.copyWith(status: SwipeStatus.loading));
      var resp = await post(
        url: '${ApiEndPoints.likePerson}${event.userId}',
        body: {
          "userId": event.userId,
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          event.onSuccess('success');
          emit(state.copyWith(status: SwipeStatus.success));
        } else {
          print(resp.body);
          print(resp.statusCode);
          emit(state.copyWith(status: SwipeStatus.failure));
        }
      } else {
        emit(state.copyWith(status: SwipeStatus.failure));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(status: SwipeStatus.failure));
    }
  }
}
