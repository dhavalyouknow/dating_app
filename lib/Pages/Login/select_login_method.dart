import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Pages/CreateAccount/create_account.dart';
import 'package:dating_app/Pages/Login/login_handler.dart';
import 'package:dating_app/Pages/Login/login_page.dart';
import 'package:dating_app/widget/Button/apple_btn.dart';
import 'package:dating_app/widget/Button/facebook_btn.dart';
import 'package:dating_app/widget/Button/google_btn.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SelectLoginMethod extends StatefulWidget {
  static const routeName = '/SelectLoginMethod';

  const SelectLoginMethod({Key? key}) : super(key: key);

  @override
  State<SelectLoginMethod> createState() => _SelectLoginMethodState();
}

class _SelectLoginMethodState extends State<SelectLoginMethod>
    with LoginHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.primaryColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height / 10),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50.h,
                        left: 40.w,
                        right: 40.w,
                        bottom: 30.h,
                      ),
                      child: const Image(
                        image: AssetImage("assets/logo.png"),
                      ),
                    ),
                    GradientBtn(
                      borderRadius: 10.r,
                      fontSize: 16.sp,
                      height: size.height / 14,
                      txt: "Sign Up Manually",
                      onTap: () {
                        Navigator.pushNamed(context, CreateAccount.routeName);
                      },
                    ),
                    GoogleBtnWidget(
                      color: AppStyles.whiteColor,
                      onPressed: signInWithGoogle,
                      title: 'Sign Up with Google',
                      image: Image.asset('assets/icons/google.png'),
                    ),
                    FaceBookBtnWidget(
                      onPressed: signInWithFacebook,
                      title: 'Sign Up with Facebook',
                      image: Image.asset(
                        'assets/icons/facebook.png',
                        height: 18.h,
                      ),
                    ),

                    AppleBtnWidget(
                      onPressed: signInWithApple,
                      title: "Sign Up With Apple",
                      image: Image.asset(
                        "assets/icons/AppleIcon.png",
                        height: 23.h,
                        color: AppStyles.blackColor,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 15.h),
                    //   child: SignInWithAppleButton(
                    //     height: size.height / 14,
                    //     style: SignInWithAppleButtonStyle.black,
                    //     onPressed: signInWithApple,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppStyles.blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginPage.routeName);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: AppStyles.blackColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          if (isLoading) const LoadingWidget()
        ],
      ),
    );
  }
}
