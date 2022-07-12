import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dating_app/Core/base/base_http_service.dart';
import 'package:dating_app/Model/image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_upload_event.dart';
part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState>
    with BaseHttpService {
  ImageUploadBloc() : super(const ImageUploadInitial()) {
    on<ImageUploadEvent>((event, emit) {});
    on<UploadImage>(_onUploadImage);
  }

  Future<void> _onUploadImage(
    UploadImage event,
    Emitter<ImageUploadState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ImageStatus.loading));

      var resp = await multipartPost(file: event.image);

      if (resp != null) {
        Map<String, dynamic> rawImage = jsonDecode(resp);
        if (kDebugMode) {
          print(rawImage);
        }
        if (rawImage["_id"] != null) {
          event.onSuccess(Image.fromJson(rawImage));
          emit(state.copyWith(status: ImageStatus.success));
        } else {
          emit(state.copyWith(status: ImageStatus.failure));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(state.copyWith(status: ImageStatus.failure));
    }
  }
}
