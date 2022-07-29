import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/ImageCropper/image_cropper_handler.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/EditPersonProfile/edit_person_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/editPersonAllField.dart';
import 'package:dating_app/widget/editPersonFieldWidget.dart';
import 'package:dating_app/widget/editWidget.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        String alreadySelectedStatus = userState.user!.relationshipStatus!;
        String alreadySelectedInterestedIn = userState.user!.interestedIn!;
        String alreadySelectedOccupation = userState.user!.occupation!;
        String alreadySelectedEyeColor = userState.user!.eyeColor!;
        String alreadyCurrentLength = userState.user!.length!.toString();
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: GradientBtn(
              borderRadius: 10.r,
              height: size.height / 14,
              txt: "Save",
              boxShadow: [
                BoxShadow(
                  color: AppStyles.shadowColor.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(5, 5), // changes position of shadow
                ),
              ],
              onTap: () {
                User user =
                    BlocProvider.of<UserBloc>(context).state.user as User;
                user = user.copyWith(
                  firstName: editFirstNameController.text,
                  lastName: editLastNameController.text,
                  aboutSelf: editAboutSelfController.text,
                  haveDog: haveDog,
                  relationshipStatus: selectedStatus.isEmpty
                      ? alreadySelectedStatus
                      : selectedStatus,
                  interestedIn: selectedInterestedIn.isEmpty
                      ? alreadySelectedInterestedIn
                      : selectedInterestedIn,
                  haveKids: haveKids,
                  occupation: selectedOccupation.isEmpty
                      ? alreadySelectedOccupation
                      : selectedOccupation,
                  eyeColor: selectedEyeColor.isEmpty
                      ? alreadySelectedEyeColor
                      : selectedEyeColor,
                  length: 2,
                  interests:
                      interests.isEmpty ? userState.user!.interests : interests,
                  favouriteNight:
                      nights.isEmpty ? userState.user!.favouriteNight : nights,
                  activity: activities.isEmpty
                      ? userState.user!.activity
                      : activities,
                );
                BlocProvider.of<UserBloc>(context).add(
                  UpdateUserEvent(
                    user: user,
                    success: (value) {
                      Fluttertoast.showToast(
                          msg: 'Your Profile Updated Successfully');
                      Navigator.pushReplacementNamed(context, '/MyPage');
                    },
                  ),
                );
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                              imageUrl: userState.user!.squareProfileImage !=
                                      null
                                  ? userState.user!.squareProfileImage![i].url
                                      .toString()
                                  : "",
                              fit: BoxFit.cover,
                              errorWidget: (BuildContext context, url, data) {
                                return const ImageErrorWidget();
                              },
                              placeholder: (context, url) =>
                                  const LoadingWidget(),
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
                                  size: 20.sp,
                                  FontAwesomeIcons.penToSquare,
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
                    EditPersonFieldWidget(
                      name: 'Name',
                      container: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        height: size.width * 0.08,
                        width: size.width / 1.5,
                        child: TextFormField(
                          controller: editFirstNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'enter first name',
                          ),
                        ),
                      ),
                    ),
                    EditPersonFieldWidget(
                      name: 'About',
                      container: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        height: size.width * 0.08,
                        width: size.width / 1.5,
                        child: TextFormField(
                          controller: editAboutSelfController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'about',
                          ),
                        ),
                      ),
                    ),
                    EditPersonFieldWidget(
                      name: 'Age',
                      container: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        height: size.width * 0.08,
                        width: size.width / 1.5,
                        child: TextFormField(
                          controller: editAgeController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'age',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    EditPersonAllField(
                      user: userState.user,
                      alreadySelectedStatus: alreadySelectedStatus,
                      alreadySelectedInterestedIn: alreadySelectedInterestedIn,
                      alreadyCurrentLength: alreadyCurrentLength,
                      alreadySelectedOccupation: alreadySelectedOccupation,
                      alreadySelectedEyeColor: alreadySelectedEyeColor,
                      statusCallBack: (value) {
                        selectedStatus = value;
                        setState(() {});
                      },
                      interestedInCallBack: (value) {
                        selectedInterestedIn = value;
                        setState(() {});
                      },
                      occupationCallBack: (value) {
                        selectedOccupation = value;
                        setState(() {});
                      },
                      eyeColorCallBack: (value) {
                        selectedEyeColor = value;
                        setState(() {});
                      },
                      currentLengthCallBack: (value) {
                        currentLength = value;
                        setState(() {});
                      },
                      haveDogCallBack: (value) {
                        haveDog = value;
                        setState(() {});
                      },
                      haveKidCallBack: (value) {
                        haveKids = value;
                        setState(() {});
                      },
                      interestsCallBack: (value) {
                        interests = value;
                        setState(() {});
                      },
                      nightsCallBack: (value) {
                        nights = value;
                        setState(() {});
                      },
                      activitiesCallBack: (value) {
                        activities = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
