import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/ImageCropper/image_cropper_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseDogPicture extends StatefulWidget {
  const ChooseDogPicture({Key? key}) : super(key: key);

  @override
  State<ChooseDogPicture> createState() => _ChooseDogPictureState();
}

class _ChooseDogPictureState extends State<ChooseDogPicture>
    with ImageCropperHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GradientBtn(
          height: size.height / 14,
          txt: "Next",
          onTap: () {
            if (imageFile != null) {
              Navigator.pushReplacementNamed(context, '/MyPage');
            }
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppStyles.whiteColor,
        elevation: 0.0,
      ),
      body: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          print(state);
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppStyles.forgotPassGradientColor,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  Center(
                    child: AppText(
                      size: 21.sp,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.bold)
                              .fontFamily,
                      text: "Choose Your Dog Picture",
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffFAC7D1),
                          blurRadius: 20.sp,
                          offset: const Offset(-1, -4),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        editImage(type: "dog");
                      },
                      child: CircleAvatar(
                        backgroundColor: AppStyles.rosyWhiteColor,
                        radius: 300.r,
                        child: imageFile == null
                            ? ImageIcon(
                                const AssetImage("assets/Add_Dog_Profile.png"),
                                size: 100.h,
                                color: const Color(0xffFAC7D1),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(imageFile!),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  imageFile == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.camera_alt_outlined),
                            SizedBox(width: 10.w),
                            AppText(
                              text: "Upload picture",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.bold)
                                  .fontFamily,
                            ),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  removeImage();
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.close,
                                      color: AppStyles.crimsonPinkColor,
                                    ),
                                    SizedBox(width: 5.w),
                                    AppText(
                                      color: AppStyles.crimsonPinkColor,
                                      text: "Remove",
                                      fontFamily: GoogleFonts.raleway(
                                              fontWeight: FontWeight.bold)
                                          .fontFamily,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  editImage(type: "dog");
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppStyles.blackColor,
                                    ),
                                    SizedBox(width: 5.w),
                                    AppText(
                                      color: AppStyles.blackColor,
                                      text: "Replace",
                                      fontFamily: GoogleFonts.raleway(
                                              fontWeight: FontWeight.bold)
                                          .fontFamily,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
<<<<<<< Updated upstream
                  // SizedBox(height: 200.h),
                  // GradientBtn(
                  //   height: size.height / 14,
                  //   txt: "Next",
                  //   onTap: () {
                  //     if (imageFile != null) {
                  //       Navigator.pushReplacementNamed(context, '/MyPage');
                  //     }
                  //   },
                  // )
=======
                  SizedBox(height: 200.h),
                  GradientBtn(
                    height: size.height / 14,
                    txt: "Next",
                    onTap: () {
                      print('*****');
                      print(isDone);
                      if (imageFile != null) {
                        Navigator.pushReplacementNamed(context, '/MyPage');
                      }
                    },
                  )
>>>>>>> Stashed changes
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  removeImage() {
    imageFile = null;
    setState(() {});
  }
}
