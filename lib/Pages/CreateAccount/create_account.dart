import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                color: AppStyles.btnColor,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              size: 30.h,
              Icons.arrow_back_ios,
              color: AppStyles.btnColor,
            ),
          ),
        ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: AppText(
                  size: 21.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: "Create account",
                ),
              ),
              TextFormFieldWidget(
                borderRadius: 10,
                icon: const Icon(Icons.person_outline),
                height: size.height / 14,
                txt: "Name",
                obscureText: false,
                border: 1,
                borderColor: AppStyles.btnColor,
              ),
              TextFormFieldWidget(
                 borderRadius: 10,
                icon: const Icon(Icons.person_outline),
                height: size.height / 14,
                txt: "Surname",
                obscureText: false,
                border: 1,
                borderColor: AppStyles.btnColor,
              ),
              TextFormFieldWidget(
                 borderRadius: 10,
                icon: const Icon(Icons.email_outlined),
                height: size.height / 14,
                txt: "Email",
                obscureText: false,
                border: 1,
                borderColor: AppStyles.btnColor,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextFormFieldWidget(
                       borderRadius: 10,
                      icon: const Icon(Icons.male),
                      height: size.height / 14,
                      txt: "Gender",
                      obscureText: false,
                      border: 1,
                      borderColor: AppStyles.btnColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: TextFormFieldWidget(
                       borderRadius: 10,
                      icon: const Icon(Icons.cake_outlined),
                      height: size.height / 14,
                      txt: "Birthday",
                      obscureText: false,
                      border: 1,
                      borderColor: AppStyles.btnColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 180.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: () {
                  Navigator.pushNamed(context, "/ChoosePartner");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(text: "Already have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: AppText(text: "Sign In Instead"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
