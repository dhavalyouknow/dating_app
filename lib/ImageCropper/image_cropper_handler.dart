import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Bloc/ImageUpload/image_upload_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Model/dog.dart';
import 'package:dating_app/Model/squareprofileimage.dart';
import 'package:dating_app/Model/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

mixin ImageCropperHandlers<T extends StatefulWidget> on State<T> {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  File? logoFile;
  bool isLoading = false;
  ImageSource? source;
  String updateType = '';
  User? user;
  File? squareImageFile;
  File? circleImageFile;
  SquareProfileImage? addSquareProfileImage;
  bool isDone = false;

  @override
  initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(
      SessionRequest(
        onSuccess: (user) {
          this.user = user;
        },
      ),
    );
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> editImage({required String type, int? index}) async {
    updateType = type;

    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 200.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Camera',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  leading: Icon(
                    Icons.camera_alt_outlined,
                    color: Theme.of(context).hintColor,
                  ),
                  onTap: () {
                    source = ImageSource.camera;
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 1.0.h,
                  color: Colors.grey.shade50,
                ),
                ListTile(
                  title: Text(
                    'Gallery',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  leading: Icon(
                    Icons.add_photo_alternate_sharp,
                    color: Theme.of(context).hintColor,
                  ),
                  onTap: () {
                    source = ImageSource.gallery;
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 1.0.h,
                  color: Colors.grey.shade50,
                ),
                ListTile(
                  title: Text(
                    'Cancel',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  leading: Icon(
                    Icons.logout,
                    color: Theme.of(context).hintColor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
    if (source != null) {
      final XFile? image;
      if (source == ImageSource.gallery) {
        image = await _picker.pickImage(source: ImageSource.gallery);
      } else {
        image = await _picker.pickImage(
            source: ImageSource.camera, imageQuality: 50);
      }

      if (image != null) {
        imageFile = File(image.path);
        isLoading = true;

        cropImage(
          style: CropStyle.rectangle,
          aspectRatio: const CropAspectRatio(ratioX: 8, ratioY: 10),
          index: index,
        );

        setState(() {});
      }
    }
  }

  Future<void> cropImage(
      {int? index,
      required CropStyle style,
      required CropAspectRatio aspectRatio}) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath:
          squareImageFile == null ? imageFile!.path : squareImageFile!.path,
      aspectRatio: aspectRatio,
      cropStyle: style,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
          backgroundColor: Colors.transparent,
          dimmedLayerColor: const Color(0xffD5F1EB).withOpacity(0.5),
          toolbarColor: const Color(0xffD5F1EB).withOpacity(0.5),
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          showCropGrid: false,
          lockAspectRatio: true,
          hideBottomControls: true,
          cropFrameStrokeWidth: 3,
          cropGridColor: Colors.red,
          cropGridRowCount: 8,
          toolbarTitle: 'Crop Image',
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      if (style == CropStyle.rectangle) {
        squareImageFile = File(croppedFile.path);
        cropImage(
          style: CropStyle.circle,
          aspectRatio: const CropAspectRatio(ratioX: 8, ratioY: 10),
        );
        onSquareImageUpdate();
      } else {
        circleImageFile = File(croppedFile.path);
        isLoading = true;
        onCircleImageUpdate(index);
      }
      setState(() {});
    }
  }

  onSquareImageUpdate() {
    BlocProvider.of<ImageUploadBloc>(context).add(
      UploadImage(
        image: squareImageFile!,
        onSuccess: (SquareProfileImage value) {
          addSquareProfileImage = value;
          setState(() {});
        },
      ),
    );
  }

  onCircleImageUpdate(int? index) {
    if (updateType == 'person') {
      BlocProvider.of<ImageUploadBloc>(context).add(
        UploadImage(
          image: circleImageFile!,
          onSuccess: (SquareProfileImage value) {
            user = user?.copyWith(
              circleProfileImage: value,
              squareProfileImage: [
                ...?user?.squareProfileImage,
                addSquareProfileImage!
              ],
            );
            BlocProvider.of<UserBloc>(context).add(
              UpdateUserEvent(
                user: user!,
                success: (value) {
                  Fluttertoast.showToast(
                    msg: 'Your Profile Picture is added successfully',
                  );
                  BlocProvider.of<AuthBloc>(context).add(
                    SessionRequest(
                      onSuccess: (User user) {
                        BlocProvider.of<UserBloc>(context)
                            .add(SetUser(user: user));
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
    } else if (updateType == "person profile") {
      BlocProvider.of<ImageUploadBloc>(context).add(
        UploadImage(
          image: circleImageFile!,
          onSuccess: (SquareProfileImage value) {
            user = user?.copyWith(
              circleProfileImage: value,
              squareProfileImage: [
                ...?user?.squareProfileImage,
                addSquareProfileImage!
              ],
            );
            BlocProvider.of<UserBloc>(context).add(
              UpdateUserEvent(
                user: user!,
                success: (value) {
                  Fluttertoast.showToast(
                    msg: 'Your Profile Picture is added successfully',
                  );
                  BlocProvider.of<AuthBloc>(context).add(
                    SessionRequest(
                      onSuccess: (User user) {
                        BlocProvider.of<UserBloc>(context)
                            .add(SetUser(user: user));
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
    }
    //for dog
    else {
      Dog dog = BlocProvider.of<DogBloc>(context).state.dog as Dog;

      BlocProvider.of<ImageUploadBloc>(context).add(
        UploadImage(
          image: circleImageFile!,
          onSuccess: (SquareProfileImage value) {
            //dog image update
            dog = dog.copyWith(squareProfileImage: [
              ...?dog.squareProfileImage,
              addSquareProfileImage!
            ], circleProfileImage: value);

            //dog update
            BlocProvider.of<DogBloc>(context).add(
              UpdateDogEvent(
                dog: dog,
                squareProfileImage: [addSquareProfileImage!.id!],
                circleProfileImage: value.id!,
                success: (value) {
                  //user update
                  user = user?.copyWith(dog: [...?user?.dog, dog]);

                  //set user from our side
                  BlocProvider.of<AuthBloc>(context).add(
                    SessionRequest(
                      onSuccess: (User user) {
                        BlocProvider.of<UserBloc>(context).add(
                          SetUser(user: user),
                        );
                      },
                    ),
                  );
                  isDone = true;
                  setState(() {});
                },
              ),
            );
          },
        ),
      );
    }
  }
}
