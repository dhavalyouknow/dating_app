import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/ImageCropper/image_cropper_handler.dart';
import 'package:dating_app/Pages/UploadProfile/upload_profile_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UploadProfile extends StatefulWidget {
  static const routeName = "/UploadProfile";

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
        backgroundColor: AppStyles.whiteColor,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  size: 21.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: AppLocalizations.of(context)!.uploadProfilePicture,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imageFile == null ||
                            circleImageFile == null ||
                            squareImageFile == null
                        ? GestureDetector(
                            onTap: () {
                              editImage(type: 'person');
                            },
                            child: Container(
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
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 100.h,
                                  color: const Color(0xffFAC7D1),
                                ),
                              ),
                            ),
                          )
                        : Row(
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 200.h,
                                  width: 200.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.file(
                                      squareImageFile!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: 250,
                                  height: 250,
                                  margin: EdgeInsets.only(left: 5.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: FileImage(circleImageFile!),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 15.h,
                    ),
                    imageFile == null
                        ? GestureDetector(
                            onTap: () {
                              editImage(type: 'person');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.camera_alt_outlined),
                                SizedBox(width: 10.w),
                                AppText(
                                  text: AppLocalizations.of(context)!.remove,
                                  fontFamily: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold)
                                      .fontFamily,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.w,
                              vertical: 10.h,
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  editImage(type: "person");
                                  imageFile = null;
                                  circleImageFile = null;
                                  squareImageFile = null;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                            ),
                          ),
                  ],
                ),
                Column(
                  children: [
                    imageFile == null
                        ? GradientBtn(
                            borderRadius: 10.r,
                            height: size.height / 14,
                            txt: AppLocalizations.of(context)!.next,
                            onTap: () {},
                          )
                        : GradientBtn(
                            borderRadius: 10.r,
                            height: size.height / 14,
                            txt: AppLocalizations.of(context)!.save,
                            onTap: () {
                              if (imageFile != null && !isLoading) {
                                onProfileSave(isVerify: user!.isEmailVerified!);
                              }
                            },
                          ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                              text: AppLocalizations.of(context)!
                                  .alreadyHaveAccount),
                          TextButton(
                            onPressed: () {},
                            child: AppText(
                                text: AppLocalizations.of(context)!.signIn),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (isLoading) const LoadingWidget()
        ],
      ),
    );
  }
}
