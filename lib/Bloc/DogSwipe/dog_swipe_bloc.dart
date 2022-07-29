import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/dogSwipe.dart';
import 'package:equatable/equatable.dart';

part 'dog_swipe_event.dart';
part 'dog_swipe_state.dart';

class DogSwipeBloc extends Bloc<DogSwipeEvent, DogSwipeState>
    with BaseHttpService {
  DogSwipeBloc() : super(const DogSwipeInitial()) {
    on<DogSwipeEvent>((event, emit) {});
    on<GetDogSwiperList>(_onGetDogSwiperList);
  }
  _onGetDogSwiperList(
      GetDogSwiperList event, Emitter<DogSwipeState> emit) async {
    try {
      emit(state.copyWith(status: DogSwipeStatus.loading));
      var resp = await get(url: ApiEndPoints.dogSwipe);
      print(ApiEndPoints.dogSwipe);
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.statusCode);
          print(resp.body);
          dynamic result = jsonDecode(resp.body);
          List<DogSwipe> dogSwipes = [];
          for (dynamic json in result) {
            dogSwipes.add(DogSwipe.fromJson(json));
          }
          emit(state.copyWith(
              status: DogSwipeStatus.success, dogSwipes: dogSwipes));
        } else {
          print(resp.statusCode);
          print(resp.body);
          emit(state.copyWith(status: DogSwipeStatus.failure));
        }
      } else {
        emit(state.copyWith(status: DogSwipeStatus.failure));
      }
    } catch (e) {
      print(e);
      print('---dog--swipe');
      emit(state.copyWith(status: DogSwipeStatus.failure));
    }
  }
}
