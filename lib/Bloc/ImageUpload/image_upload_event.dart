part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent extends Equatable {}

class UploadImage extends ImageUploadEvent {
  final String? image;
  final VoidCallback? onSuccess;

  UploadImage({
    this.image,
    this.onSuccess,
  });

  @override
  List<Object?> get props => [image, onSuccess];
}
