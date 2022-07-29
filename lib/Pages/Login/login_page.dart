import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Pages/AccountRecovery/account_recovery.dart';
import 'package:dating_app/Pages/Login/login_handler.dart';
import 'package:dating_app/Pages/Login/select_login_method.dart';
import 'package:dating_app/widget/Button/apple_btn.dart';
import 'package:dating_app/widget/Button/facebook_btn.dart';
import 'package:dating_app/widget/Button/google_btn.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:dating_app/widget/localization/LanguageWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: LanguageWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        left: 40.w,
                        right: 40.w,
                        bottom: 30.h,
                      ),
                      child: const Image(
                        image: AssetImage("assets/logo.png"),
                      ),
                    ),
<<<<<<< HEAD
                    TextFormFieldWidget(
                      textEditingController: emailController,
                      validator: emailValidator,
                      borderRadius: 10,
                      height: size.height / 14,
                      txt: "Email",
=======
                    FormFieldWidget(
>>>>>>> 1c371b6838fc5687b6fd41067a3e8a66b02f06b6
                      icon: IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {},
                      ),
                      obSecure: false,
                      border: 0.r,
                      borderColor: AppStyles.trasnparentColor,
                      obscureText: false,
                    ),
                    FormFieldWidget(
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
                      backgroundColor: AppStyles.whiteColor,
                      hintText: 'Password',
                      textEditingController: passwordController,
                      validator: passwordValidator,
                      obSecure: signUpPwd,
                      border: 0.r,
                      borderColor: AppStyles.trasnparentColor,
                      borderRadius: 10.r,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AccountRecovery.routeName,
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgotPassword,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppStyles.blackColor,
                          ),
                        ),
                      ),
                    ),
                    GradientBtn(
                      fontSize: 16.sp,
                      borderRadius: 10.r,
                      height: size.height / 14,
                      txt: AppLocalizations.of(context)!.login,
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
                    AppleBtnWidget(
                      onPressed: signInWithApple,
                      title: "Sign In With Apple",
                      image: Image.asset(
                        "assets/icons/AppleIcon.png",
                        height: 23.h,
                        color: AppStyles.whiteColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.account,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppStyles.blackColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SelectLoginMethod.routeName);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.signUp,
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
