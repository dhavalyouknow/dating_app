import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/ImInterestedIn/im_interested_in.dart';
import 'package:dating_app/Dialog/RelationshipStatus/relationship_status.dart';
import 'package:dating_app/Dialog/eyecolor/eyecolor_widget.dart';
import 'package:dating_app/Dialog/occuption/occuptionWidget.dart';
import 'package:dating_app/Pages/SetupProfile/setup_profile1/setup_profile1_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SetupProfile1 extends StatefulWidget {
  const SetupProfile1({Key? key}) : super(key: key);

  @override
  State<SetupProfile1> createState() => _SetupProfile1State();
}

class _SetupProfile1State extends State<SetupProfile1>
    with SetupProfile1Handlers {
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
                    text: "(1/3)",
                  )
                ],
              ),
              SizedBox(height: 20.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Have a dog?",
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  ...yesNo.map(
                    (e) {
                      return Expanded(
                        child: DefaultAppBtn(
                          height: size.height / 16,
                          border: 1.r,
                          borderRadius: 20.r,
                          borderColor: AppStyles.greyColor,
                          txt: e,
                          txtColor: AppStyles.blackColor,
                          onTap: () {
                            onHaveDogSubmit(e);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Relationship Status",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return RelationshipStatus(
                        callback: (value) {
                          setState(() {
                            selectedStatus = value;
                          });
                        },
                      );
                    },
                  );
                },
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.greyColor,
                txt: selectedStatus.isEmpty
                    ? "Select An Option"
                    : selectedStatus,
                txtColor: Colors.red,
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "I'm Interested In",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ImInterestedIn(
                        callback: (value) {
                          setState(() {
                            selectedInterestedIn = value;
                          });
                        },
                      );
                    },
                  );
                },
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.greyColor,
                txt: selectedInterestedIn.isEmpty
                    ? "Select An Option"
                    : selectedInterestedIn,
                txtColor: AppStyles.greyColor,
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Have kids?",
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  ...yesNo.map(
                    (e) {
                      return Expanded(
                        child: DefaultAppBtn(
                          height: size.height / 16,
                          border: 1.r,
                          borderRadius: 20.r,
                          borderColor: AppStyles.greyColor,
                          txt: e,
                          txtColor: AppStyles.blackColor,
                          onTap: () {
                            onKidSubmit(e);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Occupation",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return OccupationWidget(
                        callback: (value) {
                          setState(() {
                            selectedOccupation = value;
                          });
                        },
                      );
                    },
                  );
                },
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.greyColor,
                txt: selectedOccupation.isEmpty
                    ? "Select An Option"
                    : selectedOccupation,
                txtColor: AppStyles.greyColor,
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Eye Colour",
              ),
              SizedBox(height: 10.h),
              DefaultAppBtn(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return EyeColorWidget(
                        callback: (value) {
                          setState(() {
                            selectedEyeColor = value;
                          });
                        },
                      );
                    },
                  );
                },
                borderRadius: 20.r,
                height: size.height / 16,
                border: 1.r,
                borderColor: AppStyles.greyColor,
                txt: selectedEyeColor.isEmpty
                    ? "Select An Option"
                    : selectedEyeColor,
                txtColor: AppStyles.greyColor,
              ),
              SizedBox(height: 10.h),
              AppText(
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
                text: "Length (cm)",
              ),
              // SizedBox(height: 10.h),
              TextFormFieldWidget(
                height: size.height / 14,
                txt: "Enter your lenght",
                obscureText: false,
                border: 1.r,
                borderColor: AppStyles.greyColor,
                borderRadius: 20.r,
              ),
              SizedBox(height: 20.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: onSubmitProfile1,
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
