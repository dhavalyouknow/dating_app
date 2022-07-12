import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog_handler.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/Button/gender_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/add_your_dog.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:dating_app/widget/dog_size_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddYourDog extends StatefulWidget {
  const AddYourDog({Key? key}) : super(key: key);

  @override
  State<AddYourDog> createState() => _AddYourDogState();
}

class _AddYourDogState extends State<AddYourDog> with AddYourDogHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Icon(
            size: 30.h,
            Icons.arrow_back_ios,
            color: AppStyles.greyColor,
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
              SizedBox(height: 10.h),
              Center(
                child: AppText(
                  size: 21.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: "Add Your Dog",
                ),
              ),
              SizedBox(
                height: size.height / 14,
              ),
              TextFormFieldWidget(
                height: size.height / 14,
                txt: "Dog Name",
                obscureText: false,
                border: 2,
                borderColor: AppStyles.greyColor,
                borderRadius: 22,
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
                  ...selectGender.map(
                    (e) {
                      return Flexible(
                        child: GenderBtn(
                          height: size.height / 14,
                          border: e.selected ? 3.r : 1.r,
                          borderRadius: 25,
                          borderColor: e.selected
                              ? AppStyles.greyColor
                              : AppStyles.pinkColor,
                          txt: e.name,
                          txtColor: AppStyles.blackColor,
                          onTap: () {
                            for (var tapped in selectGender) {
                              tapped.selected = false;
                            }
                            e.selected = true;
                            selectedDogGender = e.name;
                            setState(() {});
                          },
                          icon: e.icon,
                        ),
                      );
                    },
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
              Wrap(
                children: [
                  ...sizeOfDog.map(
                    (e) {
                      return Flexible(
                        child: DefaultAppBtn(
                          height: size.height / 14,
                          border: e.selected ? 3.r : 1.r,
                          borderRadius: 20.r,
                          borderColor: AppStyles.greyColor,
                          txt: e.name,
                          txtColor: AppStyles.greyColor,
                          onTap: () {
                            for (var tapped in sizeOfDog) {
                              tapped.selected = false;
                            }
                            e.selected = true;
                            selectedDogSize = e.name;
                            setState(() {});
                          },
                        ),
                      );
                    },
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
              Wrap(
                children: [
                  ...dogLookingFor.map(
                    (e) {
                      return DefaultAppBtn(
                        height: size.height / 14,
                        border: e.selected ? 3.r : 1.r,
                        borderRadius: 20.r,
                        borderColor: AppStyles.greyColor,
                        txt: e.name,
                        txtColor: AppStyles.greyColor,
                        onTap: () {
                          // onHaveDogSubmit(e.name);
                          for (var tapped in dogLookingFor) {
                            tapped.selected = false;
                          }
                          myDogLookingFor.add(e.name);
                          e.selected = true;
                          setState(
                            () {},
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              GradientBtn(
                height: size.height / 14,
                txt: "Next",
                onTap: onSubmitDog,
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
