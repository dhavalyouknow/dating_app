import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/Eyecolor/eyecolor_widget.dart';
import 'package:dating_app/Dialog/ImInterestedIn/im_interested_in.dart';
import 'package:dating_app/Dialog/RelationshipStatus/relationship_status.dart';
import 'package:dating_app/Dialog/clothing/clothing_widget.dart';
import 'package:dating_app/Dialog/occuption/occuptionWidget.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile1/setup_profile1_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

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
    bool keybordIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !keybordIsOpen,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: GradientBtn(
            borderRadius: 10.r,
            height: size.height / 14,
            txt: AppLocalizations.of(context)!.next,
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
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                for (var tapped in isHaveDogs) {
                  tapped.selected = false;
                }
                for (var tapped in isHaveKid) {
                  tapped.selected = false;
                }
                // for (var tapped in interestedIn) {
                //   tapped.selected = false;
                // }
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
      body: KeyboardActions(
        config: buildKeyboardActionsConfig(context),
        child: Container(
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
                        text: AppLocalizations.of(context)!.setupProfile,
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
                    text: AppLocalizations.of(context)!.haveadog,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ...isHaveDogs.map(
                        (e) {
                          return Expanded(
                            child: DefaultAppBtn(
                              fontWeight: e.selected
                                  ? FontWeight.w700
                                  : FontWeight.normal,
                              height: size.height / 16,
                              border: e.selected ? 2.r : 1.r,
                              borderRadius: 20.r,
                              borderColor: e.selected
                                  ? AppStyles.pinkColor
                                  : AppStyles.greyColor,
                              txt: e.name,
                              txtColor: AppStyles.blackColor,
                              onTap: () {
                                onHaveDogSubmit(e.name);
                                for (var tapped in isHaveDogs) {
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
                    text: AppLocalizations.of(context)!.relationshipStatus,
                  ),
                  SizedBox(height: 10.h),
                  DefaultAppBtn(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return RelationshipStatus(
                            status: selectedStatus,
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
                    border: selectedStatus.isEmpty ? 1.r : 2.r,
                    borderColor: selectedStatus.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.pinkColor,
                    txt: selectedStatus.isEmpty
                        ? AppLocalizations.of(context)!.selectandoption
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
                    text: AppLocalizations.of(context)!.imInterestedIn,
                  ),
                  SizedBox(height: 10.h),
                  DefaultAppBtn(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ImInterestedIn(
                            alreadyUsed: selectedInterestedIn,
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
                    border: selectedInterestedIn.isEmpty ? 1.r : 2.r,
                    borderColor: selectedInterestedIn.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.pinkColor,
                    txt: selectedInterestedIn.isEmpty
                        ? AppLocalizations.of(context)!.selectandoption
                        : selectedInterestedIn,
                    txtColor: selectedInterestedIn.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.blackColor,
                  ),
                  SizedBox(height: 10.h),
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                        .fontFamily,
                    text: AppLocalizations.of(context)!.havekids,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ...isHaveKid.map(
                        (e) {
                          return Expanded(
                            child: DefaultAppBtn(
                              fontWeight: e.selected
                                  ? FontWeight.w700
                                  : FontWeight.normal,
                              height: size.height / 16,
                              border: e.selected ? 2.r : 1.r,
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
                                for (var tapped in isHaveKid) {
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
                    text: AppLocalizations.of(context)!.occupation,
                  ),
                  SizedBox(height: 10.h),
                  DefaultAppBtn(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return OccupationWidget(
                            alreadyUsed: selectedOccupation,
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
                    border: selectedOccupation.isEmpty ? 1.r : 2.r,
                    borderColor: selectedOccupation.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.pinkColor,
                    txt: selectedOccupation.isEmpty
                        ? AppLocalizations.of(context)!.selectandoption
                        : selectedOccupation,
                    txtColor: selectedOccupation.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.blackColor,
                  ),
                  SizedBox(height: 10.h),
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                        .fontFamily,
                    text: 'Clothing Style (optional)',
                  ),
                  SizedBox(height: 10.h),
                  DefaultAppBtn(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ClothingStyleWidget(
                            alreadyUsed: selectedClothingStyle,
                            callback: (value) {
                              setState(() {
                                selectedClothingStyle = value;
                              });
                            },
                          );
                        },
                      );
                    },
                    fontWeight: selectedClothingStyle.isEmpty
                        ? FontWeight.normal
                        : FontWeight.w700,
                    borderRadius: 20.r,
                    height: size.height / 16,
                    border: selectedClothingStyle.isEmpty ? 1.r : 2.r,
                    borderColor: selectedClothingStyle.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.pinkColor,
                    txt: selectedClothingStyle.isEmpty
                        ? AppLocalizations.of(context)!.selectandoption
                        : selectedClothingStyle,
                    txtColor: selectedClothingStyle.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.blackColor,
                  ),
                  SizedBox(height: 10.h),
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                        .fontFamily,
                    text:
                        '${AppLocalizations.of(context)!.eyeColour} (optional)',
                  ),
                  SizedBox(height: 10.h),
                  DefaultAppBtn(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SelectEyeColorWidget(
                            alreadyUsed: selectedEyeColor,
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
                    border: selectedEyeColor.isEmpty ? 1.r : 2.r,
                    borderColor: selectedEyeColor.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.pinkColor,
                    txt: selectedEyeColor.isEmpty
                        ? AppLocalizations.of(context)!.selectandoption
                        : selectedEyeColor,
                    txtColor: selectedEyeColor.isEmpty
                        ? AppStyles.greyColor
                        : AppStyles.blackColor,
                  ),
                  SizedBox(height: 10.h),
                  AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                        .fontFamily,
                    text: '${AppLocalizations.of(context)!.length} (optional)',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                      right: 5.w,
                      top: 0.w,
                      bottom: 40.h,
                    ),
                    child: FormFieldWidget(
                      textInputAction: TextInputAction.done,
                      focusNode: lengthFocus,
                      type: TextInputType.number,
                      backgroundColor: AppStyles.trasnparentColor,
                      hintText: AppLocalizations.of(context)!.enterlength,
                      textEditingController: lengthController,
                      validator: (validator) {},
                      obSecure: false,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      border: 1.r,
                      onChanged: (value) {
                        isLength = value;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(height: 150.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
