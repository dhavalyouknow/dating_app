import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile3/setup_profile3_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/descriptionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetupProfile3 extends StatefulWidget {
  static const routeName = "/SetupProfile3";
  const SetupProfile3({Key? key}) : super(key: key);

  @override
  State<SetupProfile3> createState() => _SetupProfile3State();
}

class _SetupProfile3State extends State<SetupProfile3>
    with SetupProfile3Handlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GradientBtn(
          borderRadius: 10.r,
          height: size.height / 14,
          txt: AppLocalizations.of(context)!.save,
          onTap: () {
            onSubmitProfile3();
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
        iconTheme: const IconThemeData(color: AppStyles.blackColor),
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
                      text: AppLocalizations.of(context)!.setupProfile,
                    ),
                    AppText(
                      color: AppStyles.greyColor,
                      size: 21.sp,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.bold)
                              .fontFamily,
                      text: "(3/3)",
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                      .fontFamily,
                  text: AppLocalizations.of(context)!.tellusabitaboutyourself,
                ),
                SizedBox(height: 10.h),
                DescriptionWidget(
                  validator: descriptionValidator,
                  textEditingController: aboutSelfController,
                  borderRadius: 40,
                  height: size.width / 3,
                  txt: "Description",
                  obscureText: false,
                  border: 2.r,
                  borderColor: AppStyles.pinkColor,
                ),
                // SizedBox(height: 300.h),
                // GradientBtn(
                //   height: size.height / 14,
                //   txt: "Next",
                //   onTap: () {
                //     onSubmitProfile3();
                //   },
                // ),
                // SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
