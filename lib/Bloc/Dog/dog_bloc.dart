import 'dart:async';
import 'dart:convert';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/dog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> with BaseHttpService {
  DogBloc() : super(DogInitial()) {
    on<DogEvent>((event, emit) {});
    on<AddDogEvent>(_onAddDogEvent);
  }
  _onAddDogEvent(AddDogEvent event, Emitter<DogState> emit) async {
    try {
      emit(
        state.copyWith(
          status: DogStatus.loading,
        ),
      );

      var resp = await post(
        url: ApiEndPoints.addDog,
        body: {
          "dogName": event.dogName,
          "gender": event.gender,
          "size": event.size,
          "lookingFor": event.lookingFor,
          "userId": event.id,
        },
      );

      print(ApiEndPoints.addDog);
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.body);
          print(resp.statusCode);
          Map<String, dynamic> data = jsonDecode(resp.body);

          emit(
            state.copyWith(
              status: DogStatus.success,
            ),
          );
          Dog dog = Dog.fromJson(data);
          event.onSuccess(dog);
        } else {
          emit(
            state.copyWith(
              status: DogStatus.failure,
            ),
          );

          print(resp.body);
          print(resp.statusCode);
        }
      } else {
        emit(
          state.copyWith(
            status: DogStatus.failure,
          ),
        );
      }
    } catch (e) {
      print(e);
      print('add Dog-----------');
    }
  }
}
