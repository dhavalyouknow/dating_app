import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/ImInterestedIn/im_interested_in.dart';
import 'package:dating_app/Dialog/RelationshipStatus/relationship_status.dart';
import 'package:dating_app/Dialog/eyecolor/eyecolor_widget.dart';
import 'package:dating_app/Dialog/occuption/occuptionWidget.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile1/setup_profile1_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class SetupProfile1 extends StatefulWidget {
  static const routeName = "/SetupProfile1";

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GradientBtn(
          borderRadius: 10.r,
          height: size.height / 14,
          txt: "Next",
          onTap: () {
            onSubmitProfile1();
          },
          boxShadow: [
            BoxShadow(
              color: AppStyles.shadowColor.withOpacity(0.2),
              spreadRadius: 10,
              blurRadius: 20,
              offset: const Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
      ),
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      textAlign: TextAlign.center,
                      size: 21.sp,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.bold)
                              .fontFamily,
                      text: "Setup Profile",
                    ),
                    AppText(
                      color: AppStyles.greyColor,
                      size: 21.sp,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.bold)
                              .fontFamily,
                      text: "(1/3)",
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Have a dog?",
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    ...isHaveDog.map(
                      (e) {
                        return Expanded(
                          child: DefaultAppBtn(
                            fontWeight: e.selected
                                ? FontWeight.w700
                                : FontWeight.normal,
                            height: size.height / 16,
                            border: e.selected ? 3.r : 1.r,
                            borderRadius: 20.r,
                            borderColor: e.selected
                                ? AppStyles.pinkColor
                                : AppStyles.greyColor,
                            txt: e.name,
                            txtColor: AppStyles.blackColor,
                            onTap: () {
                              onHaveDogSubmit(e.name);
                              for (var tapped in isHaveDog) {
                                tapped.selected = false;
                              }
                              e.selected = true;
                              setState(() {});
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
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
                  border: selectedStatus.isEmpty ? 1.r : 3.r,
                  borderColor: selectedStatus.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.pinkColor,
                  txt: selectedStatus.isEmpty
                      ? "Select An Option"
                      : selectedStatus,
                  txtColor: selectedStatus.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.blackColor,
                  fontWeight: selectedStatus.isEmpty
                      ? FontWeight.normal
                      : FontWeight.w700,
                ),
                SizedBox(height: 10.h),
                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
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
                  fontWeight: selectedInterestedIn.isEmpty
                      ? FontWeight.normal
                      : FontWeight.w700,
                  borderRadius: 20.r,
                  height: size.height / 16,
                  border: selectedInterestedIn.isEmpty ? 1.r : 3.r,
                  borderColor: selectedInterestedIn.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.pinkColor,
                  txt: selectedInterestedIn.isEmpty
                      ? "Select An Option"
                      : selectedInterestedIn,
                  txtColor: selectedInterestedIn.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.blackColor,
                ),
                SizedBox(height: 10.h),
                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Have kids?",
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    ...isHaveKids.map(
                      (e) {
                        return Expanded(
                          child: DefaultAppBtn(
                            fontWeight: e.selected
                                ? FontWeight.w700
                                : FontWeight.normal,
                            height: size.height / 16,
                            border: e.selected ? 3.r : 1.r,
                            borderRadius: 20.r,
                            borderColor: e.selected
                                ? AppStyles.pinkColor
                                : AppStyles.greyColor,
                            txt: e.name,
                            txtColor: e.selected
                                ? AppStyles.blackColor
                                : AppStyles.greyColor,
                            onTap: () {
                              onKidSubmit(e.name);
                              for (var tapped in isHaveKids) {
                                tapped.selected = false;
                              }
                              e.selected = true;
                              setState(() {});
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
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
                  fontWeight: selectedOccupation.isEmpty
                      ? FontWeight.normal
                      : FontWeight.w700,
                  borderRadius: 20.r,
                  height: size.height / 16,
                  border: selectedOccupation.isEmpty ? 1.r : 3.r,
                  borderColor: selectedOccupation.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.pinkColor,
                  txt: selectedOccupation.isEmpty
                      ? "Select An Option"
                      : selectedOccupation,
                  txtColor: selectedOccupation.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.blackColor,
                ),
                SizedBox(height: 10.h),

                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
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
                  fontWeight: selectedEyeColor.isEmpty
                      ? FontWeight.normal
                      : FontWeight.w700,
                  borderRadius: 20.r,
                  height: size.height / 16,
                  border: selectedEyeColor.isEmpty ? 1.r : 3.r,
                  borderColor: selectedEyeColor.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.pinkColor,
                  txt: selectedEyeColor.isEmpty
                      ? "Select An Option"
                      : selectedEyeColor,
                  txtColor: selectedEyeColor.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.blackColor,
                ),
                SizedBox(height: 10.h),
                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: "Length (cm)",
                ),
                SizedBox(height: 10.h),
                DefaultAppBtn(
                  height: size.height / 16,
                  border: 1.r,
                  borderRadius: 25.r,
                  borderColor: AppStyles.greyColor,
                  txt: currentLength.isEmpty ? "Select Length" : currentLength,
                  txtColor: AppStyles.greyColor,
                  onTap: () {
                    selectLength(context);
                  },
                ),

                SizedBox(height: 80.h),

                // SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
