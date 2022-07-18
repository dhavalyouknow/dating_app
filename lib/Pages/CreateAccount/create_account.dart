import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/SelectGender/select_gender.dart';
import 'package:dating_app/Pages/CreateAccount/create_account_handler.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/Button/gender_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // For Date Formate

class CreateAccount extends StatefulWidget {
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: AppText(
                    size: 21.sp,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                    text: "Create account",
                  ),
                ),
                TextFormFieldWidget(
                  textEditingController: nameController,
                  validator: nameValidator,
                  borderRadius: 10,
                  icon: IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      color: nameController.text.isEmpty
                          ? AppStyles.greyColor
                          : AppStyles.pinkColor,
                    ),
                    onPressed: () {},
                  ),
                  height: size.height / 14,
                  txt: "Name",
                  obscureText: false,
                  border: nameController.text.isEmpty ? 1 : 2,
                  borderColor: nameController.text.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.pinkColor,
                ),
                TextFormFieldWidget(
                  textEditingController: surnameController,
                  validator: surnameValidator,
                  borderRadius: 10,
                  icon: IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      color: surnameController.text.isEmpty
                          ? AppStyles.greyColor
                          : AppStyles.pinkColor,
                    ),
                    onPressed: () {},
                  ),
                  height: size.height / 14,
                  txt: "Surname",
                  obscureText: false,
                  border: surnameController.text.isEmpty ? 1 : 2,
                  borderColor: surnameController.text.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.pinkColor,
                ),
                TextFormFieldWidget(
                  textEditingController: emailController,
                  validator: emailValidator,
                  borderRadius: 10,
                  icon: IconButton(
                    icon: Icon(
                      Icons.email_outlined,
                      color: emailController.text.isEmpty
                          ? AppStyles.greyColor
                          : AppStyles.pinkColor,
                    ),
                    onPressed: () {},
                  ),
                  height: size.height / 14,
                  txt: "Email",
                  obscureText: false,
                  border: emailController.text.isEmpty ? 1 : 2,
                  borderColor: emailController.text.isEmpty
                      ? AppStyles.greyColor
                      : AppStyles.pinkColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 18.h),
                        child: GenderBtn(
                          height: size.height / 14,
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
                          border: selectedGender.isEmpty ? 1.r : 2.r,
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
                          height: size.height / 14,
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
                              width: tapped ? 2 : 1,
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
                                DateFormat('MM-dd-yyyy').format(
                                  DateTime.parse('$selectedDate'),
                                ),
                                style: TextStyle(
                                  fontFamily: GoogleFonts.raleway(
                                    fontSize: 15.sp,
                                    fontWeight: selectedDate == DateTime.now()
                                        ? FontWeight.normal
                                        : FontWeight.w600,
                                  ).fontFamily,
                                  color: AppStyles.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CSCPicker(
                        showStates: true,
                        showCities: true,
                        flagState: CountryFlag.ENABLE,
                        dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.shade300, width: 1),
                        ),
                        disabledDropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.shade300, width: 1),
                        ),
                        countrySearchPlaceholder: "Country",
                        stateSearchPlaceholder: "State",
                        citySearchPlaceholder: "City",
                        countryDropdownLabel: countryValue.isNotEmpty
                            ? countryValue
                            : "Select Country",
                        stateDropdownLabel: "Select State",
                        cityDropdownLabel: "Select City",
                        selectedItemStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownItemStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        dropdownDialogRadius: 20.0,
                        searchBarRadius: 20.0,
                        onCountryChanged: (value) {
                          setState(() {
                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = value;
                            locationController.text = cityValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                GradientBtn(
                  height: size.height / 14,
                  txt: "Next",
                  onTap: onSubmit,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: GradientBtn(
                    height: size.height / 14,
                    txt: "Sign in with Google",
                    onTap: signInWithGoogle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: GradientBtn(
                    height: size.height / 14,
                    txt: "Sign in with Facebook",
                    onTap: signInWithFacebook,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(text: "Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
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
    );
  }
}
