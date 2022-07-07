import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/Button/gender_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddYourDog extends StatefulWidget {
  const AddYourDog({Key? key}) : super(key: key);

  @override
  State<AddYourDog> createState() => _AddYourDogState();
}

class _AddYourDogState extends State<AddYourDog> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              size: 30.h,
              Icons.arrow_back_ios,
              color: AppStyles.greyColor,
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
                  text: "Add Your Dog",
                ),
              ),
              TextFormFieldWidget(
                icon: const Icon(FontAwesomeIcons.dog),
                height: size.height / 14,
                txt: "Your dog name",
                obscureText: false,
                border: 1,
                borderColor: AppStyles.greyColor,
                borderRadius: 10,
              ),
              SizedBox(height: 15.h),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Gender",
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: GenderBtn(
                      icon: const Icon(Icons.male),
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Male",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GenderBtn(
                      icon: const Icon(Icons.female),
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Female",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "Size",
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Flexible(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Big",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Medium",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Small",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Flexible(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Mini",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Micro",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              AppText(
                size: 21.sp,
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
                text: "My dog is looking for",
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Flexible(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Friends",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Nanny",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: DefaultAppBtn(
                      height: size.height / 14,
                      border: 1.r,
                      borderRadius: 20.r,
                      borderColor: AppStyles.greyColor,
                      txt: "Love",
                      txtColor: AppStyles.greyColor,
                      onTap: () {},
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: size.width / 3,
                child: DefaultAppBtn(
                  height: size.height / 14,
                  border: 1.r,
                  borderRadius: 20.r,
                  borderColor: AppStyles.greyColor,
                  txt: "Bonus Husse",
                  txtColor: AppStyles.greyColor,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 15.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: () {},
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
