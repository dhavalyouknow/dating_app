import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/SelectGender/select_gender.dart';
import 'package:dating_app/Pages/CreateAccount/create_account_handler.dart';
import 'package:dating_app/Pages/Login/login_page.dart';
import 'package:dating_app/widget/Button/gender_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:dating_app/widget/locationPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = "/CreateAccount";
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>
    with CreateAccountHandlers {
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
      body: Stack(
        children: [
          Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Center(
                      child: AppText(
                        size: 21.sp,
                        fontFamily:
                            GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                .fontFamily,
                        text: "Create account",
                      ),
                    ),
                    FormFieldWidget(
                      icon: IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {},
                      ),
                      hintText: 'Name',
                      textEditingController: nameController,
                      validator: nameValidator,
                      obSecure: false,
                      border: nameController.text.isEmpty ? 1.r : 2.r,
                      borderColor: nameController.text.isEmpty
                          ? AppStyles.greyColor
                          : AppStyles.pinkColor,
                      borderRadius: 10.r,
                      backgroundColor: AppStyles.trasnparentColor,
                    ),
                    FormFieldWidget(
                      icon: IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {},
                      ),
                      hintText: 'Surname',
                      textEditingController: surnameController,
                      validator: surnameValidator,
                      obSecure: false,
                      border: nameController.text.isEmpty ? 1.r : 2.r,
                      borderColor: nameController.text.isEmpty
                          ? AppStyles.greyColor
                          : AppStyles.pinkColor,
                      borderRadius: 10.r,
                      backgroundColor: AppStyles.trasnparentColor,
                    ),
                    FormFieldWidget(
                      icon: IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {},
                      ),
                      hintText: 'Email',
                      textEditingController: emailController,
                      validator: emailValidator,
                      obSecure: false,
                      border: nameController.text.isEmpty ? 1.r : 2.r,
                      borderColor: nameController.text.isEmpty
                          ? AppStyles.greyColor
                          : AppStyles.pinkColor,
                      borderRadius: 10.r,
                      backgroundColor: AppStyles.trasnparentColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 18.h),
                            child: GenderBtn(
                              height: size.height / 16,
                              icon: selectedGender.isEmpty
                                  ? const Icon(
                                      Icons.male,
                                      color: AppStyles.pinkColor,
                                    )
                                  : const Icon(
                                      Icons.female,
                                      color: AppStyles.pinkColor,
                                    ),
                              txt: selectedGender.isEmpty
                                  ? "Select Gender"
                                  : selectedGender,
                              border: selectedGender.isEmpty ? 1.r : 1.5.r,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SelectGender(
                                      callback: (value) {
                                        selectedGender = value;
                                        setState(() {});
                                      },
                                    );
                                  },
                                );
                              },
                              fontWeight: selectedGender.isEmpty
                                  ? FontWeight.normal
                                  : FontWeight.w600,
                              borderRadius: 10.r,
                              borderColor: selectedGender.isEmpty
                                  ? AppStyles.greyColor
                                  : AppStyles.pinkColor,
                              txtColor: selectedGender.isEmpty
                                  ? AppStyles.greyColor
                                  : AppStyles.blackColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              selectDate(context);

                              tapped = true;
                            },
                            child: Container(
                              height: size.height / 16,
                              margin: EdgeInsets.only(top: 18.h),
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppStyles.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: tapped
                                      ? AppStyles.pinkColor
                                      : AppStyles.greyColor,
                                  width: tapped ? 1.5 : 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.cake_outlined,
                                    color: AppStyles.pinkColor,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    tapped && selectedDate != DateTime.now()
                                        ? DateFormat('MM-dd-yyyy').format(
                                            DateTime.parse('$selectedDate'),
                                          )
                                        : "Date Of Birth",
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.raleway(
                                        fontSize: 15.sp,
                                        fontWeight:
                                            selectedDate == DateTime.now()
                                                ? FontWeight.normal
                                                : FontWeight.w600,
                                      ).fontFamily,
                                      color: tapped
                                          ? AppStyles.blackColor
                                          : AppStyles.greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    LocationPicker(
                      countryCallback: (countryName) {
                        countryValue = countryName;
                      },
                      stateCallback: (stateName) {
                        stateValue = stateName;
                      },
                      cityCallback: (cityName) {
                        cityValue = cityName;
                        locationController.text = cityName;
                      },
                    ),
                    SizedBox(height: 20.h),
                    GradientBtn(
                      borderRadius: 10.r,
                      height: size.height / 14,
                      txt: "Next",
                      onTap: onSubmit,
                    ),
                    // GoogleBtnWidget(
                    //   color: Colors.grey,
                    //   onPressed: signInWithGoogle,
                    //   title: 'Sign in with Google',
                    //   image: Image.asset('assets/icons/google.png'),
                    // ),
                    // FaceBookBtnWidget(
                    //   onPressed: signInWithFacebook,
                    //   title: 'Sign in with Facebook',
                    //   image: Image.asset(
                    //     'assets/icons/facebook.png',
                    //     height: 18.h,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 8.h),
                    //   child: SignInWithAppleButton(
                    //     onPressed: signInWithApple,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(text: "Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginPage.routeName);
                          },
                          child: AppText(text: "Sign In Instead"),
                        ),
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
