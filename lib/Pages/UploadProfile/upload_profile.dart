import 'package:dating_app/Bloc/ImageUpload/image_upload_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/ImageCropper/image_cropper_handler.dart';
import 'package:dating_app/Pages/UploadProfile/upload_profile_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({Key? key}) : super(key: key);

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile>
    with UploadProfileHandlers, ImageCropperHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                //
              },
              icon: Icon(
                size: 30.h,
                Icons.close,
                color: AppStyles.greyColor,
              ),
            ),
          ),
        ],
        backgroundColor: AppStyles.whiteColor,
        elevation: 0.0,
      ),
      body: Container(
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
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Upload Profile Picture",
              ),
              SizedBox(height: 20.h),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      editImage(type: "person");
                    },
                    child: Column(
                      children: [
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
                          child: CircleAvatar(
                            backgroundColor: AppStyles.rosyWhiteColor,
                            radius: 300.r,
                            child: imageFile == null
                                ? Icon(
                                    Icons.person,
                                    size: 100.sp,
                                    color: AppStyles.greyColor,
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
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.close,
                                    color: AppStyles.crimsonPinkColor,
                                  ),
                                  SizedBox(width: 10.w),
                                  AppText(
                                    color: AppStyles.crimsonPinkColor,
                                    text: "Remove Picture",
                                    fontFamily: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold)
                                        .fontFamily,
                                  ),
                                ],
                              )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 180.h),
              imageFile == null
                  ? GradientBtn(
                      height: size.height / 14,
                      txt: "Next",
                      onTap: () {},
                    )
                  : GradientBtn(
                      height: size.height / 14,
                      txt: "Save",
                      onTap: () {
                        onProfileSave();
                      },
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(text: "Already have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: AppText(text: "Sign In Instead"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
