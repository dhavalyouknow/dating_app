import 'dart:async';
import 'dart:convert';
import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/squareprofileimage.dart';
import 'package:dating_app/Model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dog_event.dart';

part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> with BaseHttpService {
  DogBloc() : super(DogInitial()) {
    on<DogEvent>((event, emit) {});
    on<AddDogEvent>(_onAddDogEvent);
    on<UpdateDogEvent>(_onUpdateDogEvent);
    on<SetDog>(_onSetDog);
  }

  _onSetDog(SetDog event, Emitter<DogState> emit) async {
    emit(state.copyWith(status: DogStatus.success, dog: event.dog));
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
          Dog dog = Dog.fromJson(data);
          emit(
            state.copyWith(status: DogStatus.success, dog: Dog.fromJson(data)),
          );

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

  _onUpdateDogEvent(UpdateDogEvent event, Emitter<DogState> emit) async {
    try {
      var resp = await patch(
        url: '${ApiEndPoints.updateDog}${event.user.id}',
        body: {
          //"squareProfileImage": event.squareProfileImage,
          "circleProfileImage": event.circleProfileImage
        },
      );
      if (resp != null) {
        if (resp.statusCode == 200) {
          print(resp.statusCode);
          print(resp.body);
          event.success('success');
        } else {
          print(resp.statusCode);
          print(resp.body);
        }
      } else {}
    } catch (e) {
      print(e);
      print('----update--dog');
    }
  }
}
