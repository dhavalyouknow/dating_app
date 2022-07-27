import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/ImageCropper/image_cropper_handler.dart';
import 'package:dating_app/Pages/EditPersonProfile/edit_person_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/edit_formfield.dart';
import 'package:dating_app/widget/allDataFieldWidget.dart';
import 'package:dating_app/widget/editWidget.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPersonProfile extends StatefulWidget {
  static const routeName = "/EditPersonProfile";

  const EditPersonProfile({Key? key}) : super(key: key);

  @override
  State<EditPersonProfile> createState() => _EditPersonProfileState();
}

class _EditPersonProfileState extends State<EditPersonProfile>
    with EditPersonHandlers, ImageCropperHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        editFirstNameController =
            TextEditingController(text: userState.user?.firstName);
        editLastNameController =
            TextEditingController(text: userState.user?.lastName);
        editAboutSelfController =
            TextEditingController(text: userState.user?.aboutSelf);
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: GradientBtn(
              borderRadius: 10.r,
              height: size.height / 14,
              txt: "Save",
              onTap: () {
                onSaveUserProfile();
              },
            ),
          ),
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
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
            elevation: 0,
            centerTitle: true,
            title: AppText(
              size: 18.sp,
              text: "${userState.user!.firstName} ${userState.user!.lastName}",
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
            ),
          ),
          body: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 350.h,
                    child: PageView.builder(
                      itemCount: userState.user!.squareProfileImage!.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            editImage(
                              type: 'person profile update',
                              index: i,
                            );
                            imageFile = null;
                            circleImageFile = null;
                            squareImageFile = null;
                            setState(() {
                              index = i;
                            });
                          },
                          child: CachedNetworkImage(
                            imageUrl: userState.user!.squareProfileImage != null
                                ? userState.user!.squareProfileImage![i].url
                                    .toString()
                                : "",
                            fit: BoxFit.cover,
                            errorWidget: (BuildContext context, url, data) {
                              return const ImageErrorWidget();
                            },
                            placeholder: (context, url) => Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              color: Colors.grey.withOpacity(0.1),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppStyles.textColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EditWidget(
                              icon: Icon(
                                Icons.close,
                                color: index == 0
                                    ? AppStyles.pinkColor
                                    : AppStyles.blackColor,
                              ),
                              name: 'Remove',
                              isSelected: index == 0,
                              onTap: () {
                                setState(() {
                                  index = 0;
                                });
                              },
                            ),
                            EditWidget(
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: index == 1
                                    ? AppStyles.pinkColor
                                    : AppStyles.blackColor,
                              ),
                              name: 'Replace',
                              isSelected: index == 1,
                              onTap: () {
                                setState(() {
                                  index = 1;
                                });
                              },
                            ),
                            EditWidget(
                              icon: Icon(
                                Icons.edit_calendar_outlined,
                                color: index == 2
                                    ? AppStyles.pinkColor
                                    : AppStyles.blackColor,
                              ),
                              name: 'Edit',
                              isSelected: index == 2,
                              onTap: () {
                                setState(() {
                                  index = 2;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            size: 18.sp,
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                    .fontFamily,
                            text: "Name",
                          ),
                          EditFormField(
                            width: size.width / 1.5,
                            textEditingController: editFirstNameController,
                            hintTxt: "Enter Person First Name",
                          ),
                          EditFormField(
                            width: size.width / 1.5,
                            textEditingController: editLastNameController,
                            hintTxt: "Enter Person Last Name",
                          )
                        ],
                      ),
                      const Icon(Icons.edit),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            size: 18.sp,
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                    .fontFamily,
                            text: "About",
                          ),
                          EditFormField(
                            width: size.width / 1.5,
                            textEditingController: editAboutSelfController,
                            hintTxt: "Enter About Yourself",
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            size: 18.sp,
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                    .fontFamily,
                            text: "Age",
                          ),
                          AppText(
                            size: 14.sp,
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.w500)
                                    .fontFamily,
                            text: "36 y/o",
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      )
                    ],
                  ),
                  SizedBox(height: 80.h)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
