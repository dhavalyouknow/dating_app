import 'package:country_state_city_picker/country_state_city_picker.dart';
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
    String countryValue;
    String stateValue;
    String cityValue;
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
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 10.w),
        //   child: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       size: 30.h,
        //       Icons.arrow_back_ios,
        //       color: AppStyles.greyColor,
        //     ),
        //   ),
        // ),
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
                  textEditingController: nameController,
                  validator: nameValidator,
                  borderRadius: 10,
                  icon: IconButton(
                    icon: const Icon(Icons.person_outline),
                    onPressed: () {},
                  ),
                  height: size.height / 14,
                  txt: "Name",
                  obscureText: false,
                  border: nameController.text.isEmpty ? 1 : 2,
                  borderColor: AppStyles.pinkColor,
                ),
                TextFormFieldWidget(
                  textEditingController: surnameController,
                  validator: surnameValidator,
                  borderRadius: 10,
                  icon: IconButton(
                    icon: const Icon(Icons.person_outline),
                    onPressed: () {},
                  ),
                  height: size.height / 14,
                  txt: "Surname",
                  obscureText: false,
                  border: surnameController.text.isEmpty ? 1 : 2,
                  borderColor: AppStyles.pinkColor,
                ),
                TextFormFieldWidget(
                  textEditingController: emailController,
                  validator: emailValidator,
                  borderRadius: 10,
                  icon: IconButton(
                    icon: const Icon(Icons.email_outlined),
                    onPressed: () {},
                  ),
                  height: size.height / 14,
                  txt: "Email",
                  obscureText: false,
                  border: emailController.text.isEmpty ? 1 : 2,
                  borderColor: AppStyles.pinkColor,
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
                              ? const Icon(Icons.male)
                              : const Icon(Icons.female),
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
                          borderRadius: 10.r,
                          borderColor: AppStyles.pinkColor,
                          txtColor: AppStyles.blackColor,
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
                              color: AppStyles.pinkColor,
                              width: tapped ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.cake_outlined,
                                color: AppStyles.greyColor,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                DateFormat('MM-dd-yyyy').format(
                                  DateTime.parse('$selectedDate'),
                                ),
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.raleway(fontSize: 15.sp)
                                          .fontFamily,
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
                    SelectState(
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
                        });
                      },
                    ),
                    // InkWell(
                    //   onTap:(){
                    //     print('country selected is $countryValue');
                    //     print('country selected is $stateValue');
                    //     print('country selected is $cityValue');
                    //   },
                    //   child: Text(' Check')
                    // )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 18.h),
                  child: Container(
                    height: size.height / 14,
                    padding: EdgeInsets.only(left: 10.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppStyles.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppStyles.pinkColor,
                        width: locationController.text.isEmpty ? 1 : 2,
                      ),
                    ),
                    child: TextFormField(
                      onTap: () {},
                      controller: locationController,
                      validator: locationValidator,
                      obscureText: false,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left: 10.w, bottom: 30.h),

                        icon: IconButton(
                          icon: const Icon(Icons.location_on_outlined),
                          onPressed: () {},
                        ),
                        hintText: 'City',

                        hintStyle: TextStyle(
                          fontFamily: GoogleFonts.raleway(
                            fontSize: 15.sp,
                          ).fontFamily,
                          color: AppStyles.textColor,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        print(value);
                        if (value.isNotEmpty) {
                          autoCompleteSearch(value);
                        } else {
                          if (predictions.isNotEmpty && mounted) {
                            setState(() {
                              predictions = [];
                              locationController.clear();
                            });
                          }
                        }
                      },
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
                  shrinkWrap: true,
                  itemCount: predictions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: AppStyles.whiteColor,
                      ),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            locationController = TextEditingController(
                              text: predictions[index].description,
                            );
                          });
                        },
                        leading: CircleAvatar(
                          maxRadius: 15,
                          minRadius: 15,
                          backgroundColor: AppStyles.textColor,
                          child: Icon(
                            Icons.pin_drop,
                            size: 15.sp,
                            color: AppStyles.whiteColor,
                          ),
                        ),
                        title: Text(
                          predictions[index].description!,
                          style: const TextStyle(
                            color: AppStyles.blackColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 110.h),
                GradientBtn(
                  height: size.height / 14,
                  txt: "Next",
                  onTap: onSubmit,
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
