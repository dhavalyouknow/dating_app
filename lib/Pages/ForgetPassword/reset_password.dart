import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/ForgetPassword/reset_password_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = "/ResetPassword";
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword>
    with ResetPasswordHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppStyles.greyColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: AppText(
                          size: 20.sp,
                          text: "Reset Password",
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                  .fontFamily,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: AppText(
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.w500)
                                  .fontFamily,
                          text:
                              "Your new password must be different\nfrom previous used passwords.",
                        ),
                      ),
                      TextFormFieldWidget(
                        borderRadius: 10,
                        backIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.eye_slash),
                        ),
                        height: size.height / 16,
                        txt: "Current Password",
                        obscureText: true,
                        border: 1,
                        borderColor: AppStyles.greyColor,
                        textEditingController: currentPwdController,
                        validator: currentValidator,
                      ),
                      if (isVerifySuccessfull)
                        Column(
                          children: [
                            TextFormFieldWidget(
                              borderRadius: 10,
                              backIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(CupertinoIcons.eye_slash),
                              ),
                              height: size.height / 16,
                              txt: "New Password",
                              obscureText: true,
                              border: 1,
                              borderColor: AppStyles.greyColor,
                              textEditingController: newPwdController,
                              validator: currentValidator,
                            ),
                            TextFormFieldWidget(
                              borderRadius: 10,
                              height: size.height / 16,
                              txt: "Confirm Password",
                              obscureText: true,
                              border: 1,
                              borderColor: AppStyles.greyColor,
                              textEditingController: confirmPwdController,
                              validator: currentValidator,
                            ),
                          ],
                        ),
                      SizedBox(height: 20.h),
                      GradientBtn(
                        borderRadius: 10.r,
                        height: size.height / 16,
                        txt: isVerifySuccessfull
                            ? "Reset Password"
                            : "Verify Password",
                        onTap: () {
                          if (isVerifySuccessfull) {
                            updatePassword();
                          } else {
                            verifyPassword();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
