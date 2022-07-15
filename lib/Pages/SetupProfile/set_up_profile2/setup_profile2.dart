import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/AddActivities/add_activities.dart';
import 'package:dating_app/Dialog/AddInterest/add_interests.dart';
import 'package:dating_app/Dialog/FavouriteNight/add_favourite_night.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile2/set_up_profile2_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/selected_inerests_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SetupProfile2 extends StatefulWidget {
  const SetupProfile2({Key? key}) : super(key: key);

  @override
  State<SetupProfile2> createState() => _SetupProfile2State();
}

class _SetupProfile2State extends State<SetupProfile2>
    with SetupProfile2Handlers {
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
                Navigator.pop(context);
              },
              icon: Icon(
                size: 30.h,
                Icons.close,
                color: AppStyles.greyColor,
              ),
            ),
          ),
        ],
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 10.w),
        //   child: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       size: 30.h,
        //       Icons.arrow_back_ios,
        //       color: AppStyles.greyColor,
        //     ),
        //   ),
        // ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    textAlign: TextAlign.center,
                    size: 21.sp,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "Setup Profile",
                  ),
                  AppText(
                    color: AppStyles.greyColor,
                    size: 21.sp,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "(2/3)",
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                        .fontFamily,
                    text: "Interests",
                  ),
                  DefaultAppBtn(
                    width: 100.w,
                    onTap: () {},
                    borderRadius: 20.r,
                    height: size.height / 25,
                    border: 1.r,
                    borderColor: AppStyles.greyColor,
                    txt: "Add More",
                    txtColor: AppStyles.greyColor,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              interestedName.isEmpty
                  ? SizedBox(
                      width: size.width / 2,
                      child: DefaultAppBtn(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddInterests(
                                callback: (value) {
                                  interestedName = value;
                                  setState(() {});
                                },
                               // selectedList: interestedName,
                              );
                            },
                          );
                        },
                        borderRadius: 20.r,
                        height: size.height / 16,
                        border: 1.r,
                        borderColor: AppStyles.greyColor,
                        txt: "Add Interests",
                        txtColor: AppStyles.greyColor,
                      ),
                    )
                  : Wrap(
                      children: [
                        ...interestedName
                            .map(
                              (e) => SelectedChipWidget(
                                interestsName: e,
                              ),
                            )
                            .toList(),
                      ],
                    ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                        .fontFamily,
                    text: "Favourite Night",
                  ),
                  DefaultAppBtn(
                    width: 100.w,
                    onTap: () {},
                    borderRadius: 20.r,
                    height: size.height / 25,
                    border: 1.r,
                    borderColor: AppStyles.greyColor,
                    txt: "Add More",
                    txtColor: AppStyles.greyColor,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              favNights.isEmpty
                  ? SizedBox(
                      width: size.width / 2,
                      child: DefaultAppBtn(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddNightModule(
                                callback: (value) {
                                  favNights = value;
                                  setState(() {});
                                },
                              );
                            },
                          );
                        },
                        borderRadius: 20.r,
                        height: size.height / 16,
                        border: 1.r,
                        borderColor: AppStyles.greyColor,
                        txt: "Add Favourite Night",
                        txtColor: AppStyles.greyColor,
                      ),
                    )
                  : Wrap(
                      children: [
                        ...favNights
                            .map(
                              (e) => SelectedChipWidget(
                                interestsName: e,
                              ),
                            )
                            .toList()
                      ],
                    ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                        .fontFamily,
                    text: "Activities",
                  ),
                  DefaultAppBtn(
                    width: 100.w,
                    onTap: () {},
                    borderRadius: 20.r,
                    height: size.height / 25,
                    border: 1.r,
                    borderColor: AppStyles.greyColor,
                    txt: "Add More",
                    txtColor: AppStyles.greyColor,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              activities.isEmpty
                  ? SizedBox(
                      width: size.width / 2,
                      child: DefaultAppBtn(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SelectedActivities(
                                callback: (value) {
                                  activities = value;
                                  setState(() {});
                                },
                             //   selectedList: activities,
                              );
                            },
                          );
                        },
                        borderRadius: 20.r,
                        height: size.height / 16,
                        border: 1.r,
                        borderColor: AppStyles.greyColor,
                        txt: "Add Favourite",
                        txtColor: AppStyles.greyColor,
                      ),
                    )
                  : Wrap(
                      children: [
                        ...activities
                            .map(
                              (e) => Column(
                                children: [
                                  // IconButton(
                                  //   onPressed: () {
                                  //     activities.remove(e);
                                  //     setState(() {});
                                  //   },
                                  //   icon: const Icon(Icons.close),
                                  //   color: Colors.red,
                                  // ),
                                  SelectedChipWidget(
                                    interestsName: e,
                                  ),
                                ],
                              ),
                            )
                            .toList()
                      ],
                    ),
              SizedBox(height: 250.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: () {
                  onSubmitProfile2();
                },
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
