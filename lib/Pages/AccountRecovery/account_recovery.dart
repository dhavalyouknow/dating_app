
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountRecovery extends StatefulWidget {
  const AccountRecovery({Key? key}) : super(key: key);

  @override
  State<AccountRecovery> createState() => _AccountRecoveryState();
}

class _AccountRecoveryState extends State<AccountRecovery> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppStyles.btnColor,
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
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: AppText(
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: "Account Recovery",
                  size: 21.sp,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              AppText(
                fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w400).fontFamily,
                text:
                    "Enter your email and receive a link to recover\nyour account.",
                size: 15.sp,
              ),
              SizedBox(
                height: 15.h,
              ),
              TextFormFieldWidget(
                 borderRadius: 10,
                height: size.height / 14,
                txt: "Email",
                icon: const Icon(Icons.person),
                obscureText: false,
                border: 1,
                borderColor: AppStyles.btnColor,
              ),
              SizedBox(
                height: 20.h,
              ),
              GradientBtn(
                fontSize: 18.sp,
                height: size.height / 14,
                txt: "Send Link",
                onTap: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.r, right: 10.r),
                    child: AppText(
                      text: "OR",
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/CheckEmail");
                  },
                  child: AppText(
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "Create New Account",
                    size: 20.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
