import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/CreatePassword/create_password_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatePassword extends StatefulWidget {
  static const routeName = "/CreatePassword";
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword>
    with CreatePasswordHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppStyles.blackColor),
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
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 40.h),
                    AppText(
                      size: 21.sp,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.bold)
                              .fontFamily,
                      text: AppLocalizations.of(context)!.createPassword,
                    ),
                    SizedBox(height: 20.h),
                    AppText(
                      size: 14.sp,
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w500)
                              .fontFamily,
                      text: AppLocalizations.of(context)!
                          .passwordmustbeatleast8characterscontainlettersnumbersandonespecialcharacter,
                    ),
                    FormFieldWidget(
                      backIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            signUpPwd = !signUpPwd;
                          });
                        },
                        icon: signUpPwd
                            ? ImageIcon(
                                const AssetImage(
                                    "assets/icons/CloseEyeIcon.png"),
                                color: AppStyles.textColor,
                                size: 20.sp,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppStyles.textColor,
                                size: 22.sp,
                              ),
                      ),
                      backgroundColor: AppStyles.whiteColor,
                      hintText: AppLocalizations.of(context)!.password,
                      textEditingController: passwordController,
                      validator: passwordValidator,
                      obSecure: signUpPwd,
                      border: passwordController.text.isEmpty ? 1.w : 2.w,
                      borderColor: AppStyles.textColor,
                      borderRadius: 10.r,
                    ),
                    FormFieldWidget(
                      backIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            signUpCon = !signUpCon;
                          });
                        },
                        icon: signUpCon
                            ? ImageIcon(
                                const AssetImage(
                                    "assets/icons/CloseEyeIcon.png"),
                                color: AppStyles.textColor,
                                size: 20.sp,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppStyles.textColor,
                                size: 22.sp,
                              ),
                      ),
                      backgroundColor: AppStyles.whiteColor,
                      hintText: AppLocalizations.of(context)!.password,
                      textEditingController: rePasswordController,
                      validator: repeatpwdValidator,
                      obSecure: signUpCon,
                      border: rePasswordController.text.isEmpty ? 1.w : 2.w,
                      borderColor: AppStyles.textColor,
                      borderRadius: 10.r,
                    ),
                    SizedBox(height: 20.h),
                    GradientBtn(
                      borderRadius: 10.r,
                      fontSize: 15.sp,
                      height: size.height / 14,
                      txt: AppLocalizations.of(context)!.done,
                      onTap: onSignUp,
                    ),
                    SizedBox(height: 20.h),
                    AppText(
                      textAlign: TextAlign.center,
                      fontFamily: GoogleFonts.raleway().fontFamily,
                      text: AppLocalizations.of(context)!.bysigningup,
                    )
                  ],
                ),
                if (isLoading) const LoadingWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
