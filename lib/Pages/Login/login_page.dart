import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Pages/Login/login_handler.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 100.h, left: 40.w, right: 40.w, bottom: 30.h),
                child: const Image(
                  image: AssetImage("assets/logo.png"),
                ),
              ),
              TextFormFieldWidget(
                validator: emailValidator,
                borderRadius: 10,
                height: size.height / 14,
                txt: "Email",
                icon: const Icon(Icons.person_outline),
                obscureText: false,
                border: 0,
                borderColor: AppStyles.trasnparentColor,
              ),
              TextFormFieldWidget(
                validator: passwordValidator,
                borderRadius: 10,
                height: size.height / 14,
                txt: "Password",
                icon: const Icon(Icons.lock_outline),
                obscureText: false,
                border: 0,
                borderColor: AppStyles.trasnparentColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
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
                  )
                ],
              ),
              GradientBtn(
                height: size.height / 14,
                txt: "Login",
                onTap: () {
                  Navigator.pushNamed(context, "/SetupProfile2");
                },
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
                    onPressed: () {},
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
    );
  }
}
