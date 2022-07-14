part of 'image_upload_bloc.dart';

enum ImageStatus {
  initial,
  success,
  failure,
  loading,
}

class ImageUploadState extends Equatable {
  final ImageStatus status;

  const ImageUploadState({
    this.status = ImageStatus.initial,
  });

  ImageUploadState copyWith({ImageStatus? status}) {
    return ImageUploadState(
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}

class ImageUploadInitial extends ImageUploadState {
  const ImageUploadInitial() : super(status: ImageStatus.initial);
}
