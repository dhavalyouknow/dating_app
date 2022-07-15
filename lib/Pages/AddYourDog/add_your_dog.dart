import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog_handler.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/Button/gender_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/add_your_dog.dart';
import 'package:dating_app/widget/TextformfieldWidget/dog_name_textformfield.dart';
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
              Center(
                child: AppText(
                  size: 21.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: "Add Your Dog",
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              DogNameWidget(
                textEditingController: dogNameController,
                height: size.height / 14,
                txt: "Your dog name",
                obscureText: false,
                border: 1,
                borderColor: AppStyles.greyColor,
                borderRadius: 25,
                dogIcon: const ImageIcon(
                  AssetImage("assets/Dog.png"),
                  color: AppStyles.greyColor,
                ),
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
                  ...selectDogGender.map(
                    (e) {
                      return Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: GenderBtn(
                            height: size.height / 14,
                            border: e.selected ? 3.r : 1.r,
                            borderRadius: 25,
                            borderColor: e.selected
                                ? AppStyles.pinkColor
                                : AppStyles.greyColor,
                            txt: e.name,
                            txtColor: AppStyles.greyColor,
                            onTap: () {
                              for (var tapped in selectDogGender) {
                                tapped.selected = false;
                              }
                              e.selected = true;
                              selectedDogGender = e.name;
                              setState(() {});
                            },
                            icon: Icon(
                              e.icon.icon,
                              color: e.selected
                                  ? AppStyles.pinkColor
                                  : AppStyles.greyColor,
                            ),
                          ),
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
                runSpacing: 10.w,
                children: [
                  ...sizeOfDog.map(
                    (e) {
                      return DefaultAppBtn(
                        height: size.height / 14,
                        width: size.width / 4,
                        border: e.selected ? 3.r : 1.r,
                        borderRadius: 25.r,
                        borderColor: e.selected
                            ? AppStyles.pinkColor
                            : AppStyles.greyColor,
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
                runSpacing: 10.w,
                spacing: 10.w,
                // direction: Axis,

                children: [
                  ...dogLookingFor.map(
                    (e) {
                      return DefaultAppBtn(
                        height: size.height / 14,
                        width: size.width / 2.6,
                        border: myDogLookingFor.contains(e.name) ? 3.r : 1.r,
                        borderRadius: 25.r,
                        borderColor: myDogLookingFor.contains(e.name)
                            ? AppStyles.pinkColor
                            : AppStyles.greyColor,
                        txt: e.name,
                        txtColor: AppStyles.greyColor,
                        onTap: () {
                          if (myDogLookingFor.contains(e.name)) {
                            myDogLookingFor.remove(e.name);
                            print(myDogLookingFor);
                          } else {
                            myDogLookingFor.add(e.name);
                            print('myDogLookingFor ===> $myDogLookingFor');
                          }
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
