import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/SelectGender/select_gender.dart';
import 'package:dating_app/OtherLogin/otherlogin_handler.dart';
import 'package:dating_app/Pages/Login/login_page.dart';
import 'package:dating_app/widget/Button/gender_btn.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/TextformfieldWidget/formfield_widget.dart';
import 'package:dating_app/widget/locationPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtherLoginCreateAccount extends StatefulWidget {
  static const routeName = '/OtherLoginCreateAccount';

  const OtherLoginCreateAccount({Key? key}) : super(key: key);

  @override
  State<OtherLoginCreateAccount> createState() =>
      _OtherLoginCreateAccountState();
}

class _OtherLoginCreateAccountState extends State<OtherLoginCreateAccount>
    with OtherLoginHandlers {
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
                // Navigator.pop(context);
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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          nameController =
              TextEditingController(text: userState.user?.firstName);
          surnameController =
              TextEditingController(text: userState.user?.lastName);
          emailController = TextEditingController(text: userState.user?.email);
          user = userState.user;
          return Container(
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
                        text: "Update account",
                      ),
                    ),
                    FormFieldWidget(
                      icon: IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {},
                      ),
                      hintText: AppLocalizations.of(context)!.name,
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
                      hintText: AppLocalizations.of(context)!.surname,
                      textEditingController: surnameController,
                      validator: surnameValidator,
                      obSecure: false,
                      border: surnameController.text.isEmpty ? 1.r : 2.r,
                      borderColor: surnameController.text.isEmpty
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
                      hintText: AppLocalizations.of(context)!.email,
                      textEditingController: emailController,
                      validator: emailValidator,
                      obSecure: false,
                      border: emailController.text.isEmpty ? 1.r : 2.r,
                      borderColor: emailController.text.isEmpty
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
                                  ? AppLocalizations.of(context)!.selectGender
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
                                        : AppLocalizations.of(context)!
                                            .dateOfBirth,
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
                      txt: AppLocalizations.of(context)!.next,
                      onTap: onUpdateUser,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                            text: AppLocalizations.of(context)!
                                .alreadyHaveAccount),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginPage.routeName);
                          },
                          child: AppText(
                              text: AppLocalizations.of(context)!.signIn),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
