import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/CreatePassword/create_password_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePassword extends StatefulWidget {
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
              children: [
                SizedBox(height: 40.h),
                AppText(
                  size: 21.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: "Create Password",
                ),
                SizedBox(height: 20.h),
                AppText(
                  size: 14.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                  text:
                      "Password must be at least 8 characters, contain\nletters, numbers and one special character.",
                ),
                TextFormFieldWidget(
                  obSecure: signUpPwd,
                  textEditingController: passwordController,
                  validator: passwordValidator,
                  borderRadius: 10,
                  height: size.height / 14,
                  txt: "Password",
                  backIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        signUpPwd = !signUpPwd;
                      });
                    },
                    icon: signUpPwd
                        ? const Icon(
                            Icons.lock_outlined,
                            color: AppStyles.textColor,
                          )
                        : const Icon(
                            Icons.lock_open,
                            color: AppStyles.textColor,
                          ),
                  ),
                  obscureText: signUpPwd,
                  border: passwordController.text.isEmpty ? 1 : 2,
                  borderColor: AppStyles.pinkColor,
                ),
                TextFormFieldWidget(
                  validator: repeatpwdValidator,
                  textEditingController: rePasswordController,
                  borderRadius: 10,
                  height: size.height / 14,
                  txt: "Confirm Password",
                  obscureText: signUpPwd,
                  border: rePasswordController.text.isEmpty ? 1 : 2,
                  borderColor: AppStyles.pinkColor,
                ),
                SizedBox(height: 20.h),
                GradientBtn(
                  fontSize: 15.sp,
                  height: size.height / 14,
                  txt: "Done",
                  onTap: onSignUp,
                ),
                SizedBox(height: 20.h),
                AppText(
                  textAlign: TextAlign.center,
                  fontFamily: GoogleFonts.raleway().fontFamily,
                  text:
                      "By Signing up to The Dog Trick App you accept our Terms of Service and Privacy Policy.",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
