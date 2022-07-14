part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent extends Equatable {}

class UploadImage extends ImageUploadEvent {
  final File image;
  final Function(SquareProfileImage) onSuccess;

  UploadImage({
    required this.image,
    required this.onSuccess,
  });

  @override
  List<Object?> get props => [image, onSuccess];
}
