import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Pages/Login/login_handler.dart';
import 'package:dating_app/widget/Button/facebook_btn.dart';
import 'package:dating_app/widget/Button/google_btn.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginHandlers {
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
                    TextFormFieldWidget(
                      textEditingController: emailController,
                      validator: emailValidator,
                      borderRadius: 10,
                      height: size.height / 14,
                      txt: "Email",
                      icon: IconButton(
                        icon: const Icon(
                          Icons.person_outline,
                          color: AppStyles.pinkColor,
                        ),
                        onPressed: () {},
                      ),
                      obscureText: false,
                      border: 0,
                      borderColor: AppStyles.trasnparentColor,
                    ),
                    TextFormFieldWidget(
                      obSecure: signUpPwd,
                      textEditingController: passwordController,
                      validator: passwordValidator,
                      borderRadius: 10,
                      height: size.height / 14,
                      txt: "Password",
                      icon: IconButton(
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
                      border: 0,
                      borderColor: AppStyles.trasnparentColor,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/ForgetPassword");
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppStyles.blackColor,
                          ),
                        ),
                      ),
                    ),
                    GradientBtn(
                      height: size.height / 14,
                      txt: "Login",
                      onTap: onLogin,
                    ),
                    GoogleBtnWidget(
                      color: AppStyles.whiteColor,
                      onPressed: signInWithGoogle,
                      title: 'Sign in with Google',
                      image: Image.asset('assets/icons/google.png'),
                    ),
                    FaceBookBtnWidget(
                      onPressed: signInWithFacebook,
                      title: 'Sign in with Facebook',
                      image: Image.asset(
                        'assets/icons/facebook.png',
                        height: 18.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: SignInWithAppleButton(
                        onPressed: signInWithApple,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppStyles.blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/CreateAccount");
                          },
                          child: Text(
                            "Sign Up",
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
