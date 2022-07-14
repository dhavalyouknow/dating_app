import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/CreateAccount/create_account_handler.dart';
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
                  border: 1,
                  borderColor: AppStyles.greyColor,
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
                  border: 1,
                  borderColor: AppStyles.greyColor,
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
                  border: 1,
                  borderColor: AppStyles.greyColor,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormFieldWidget(
                        textEditingController: genderController,
                        validator: genderValidator,
                        borderRadius: 10,
                        icon: IconButton(
                          icon: const Icon(Icons.male),
                          onPressed: () {},
                        ),
                        height: size.height / 14,
                        txt: "Gender",
                        obscureText: false,
                        border: 1,
                        borderColor: AppStyles.greyColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          selectDate(context);
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
                              color: AppStyles.greyColor,
                              width: 1,
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
                                DateFormat('yyyy-MM-dd').format(
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
                TextFormFieldWidget(
                  textEditingController: locationController,
                  validator: locationValidator,
                  borderRadius: 10,
                  icon: IconButton(
                    icon: const Icon(Icons.location_on_outlined),
                    onPressed: () {},
                  ),
                  height: size.height / 14,
                  txt: "City",
                  obscureText: false,
                  border: 1,
                  borderColor: AppStyles.greyColor,
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
