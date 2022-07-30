import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/ImageCropper/image_cropper_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseDogPicture extends StatefulWidget {
  static const routeName = "/ChooseDogPicture";

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
          boxShadow: [
            BoxShadow(
              color: AppStyles.shadowColor.withOpacity(0.2),
              spreadRadius: 10,
              blurRadius: 20,
              offset: const Offset(5, 5), // changes position of shadow
            ),
          ],
          borderRadius: 10.r,
          height: size.height / 14,
          txt: AppLocalizations.of(context)!.next,
          onTap: () {
            if (imageFile != null) {
              Navigator.pushReplacementNamed(context, ('/MyPage'));
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
          return Stack(
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
                          text: AppLocalizations.of(context)!
                              .chooseYourDogPicture,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      imageFile == null ||
                              circleImageFile == null ||
                              squareImageFile == null
                          ? GestureDetector(
                              onTap: () {
                                editImage(type: 'dog');
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
                                  child: ImageIcon(
                                    const AssetImage(
                                      "assets/Add_Dog_Profile.png",
                                    ),
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
                      SizedBox(height: 20.h),
                      imageFile == null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.camera_alt_outlined),
                                SizedBox(width: 10.w),
                                AppText(
                                  text: AppLocalizations.of(context)!
                                      .uploadPicture,
                                  fontFamily: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold)
                                      .fontFamily,
                                ),
                              ],
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      imageFile = null;
                                      circleImageFile = null;
                                      squareImageFile = null;
                                      isLoading = false;
                                      setState(() {});
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
                      SizedBox(height: 200.h),
                    ],
                  ),
                ),
              ),
              if (isLoading) const LoadingWidget(),
            ],
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
