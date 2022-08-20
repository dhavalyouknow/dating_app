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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    List<MaleFemale> selectGender = [
      MaleFemale(
        name: AppLocalizations.of(context)!.male,
        selected: false,
        icon: const Icon(Icons.male),
      ),
      MaleFemale(
        name: AppLocalizations.of(context)!.female,
        selected: false,
        icon: const Icon(Icons.female),
      ),
      MaleFemale(
        name: AppLocalizations.of(context)!.other,
        selected: false,
        icon: const Icon(Icons.transgender),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                for (var tapped in selectGender) {
                  tapped.selected = false;
                }
                Navigator.pushReplacementNamed(context, '/LoginPage');
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
                        text: AppLocalizations.of(context)!.createAccount,
                      ),
                    ),
                    FormFieldWidget(
                      onTap: () {
                        isOnTapFName = true;
                        setState(() {});
                      },
                      icon: IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {},
                      ),
                      hintText: AppLocalizations.of(context)!.firstname,
                      textEditingController: nameController,
                      validator: nameValidator,
                      obSecure: false,
                      border: 1.r,
                      borderColor: isOnTapFName
                          ? AppStyles.pinkColor
                          : AppStyles.greyColor,
                      borderRadius: 10.r,
                      backgroundColor: AppStyles.trasnparentColor,
                    ),
                    FormFieldWidget(
                      onTap: () {
                        isOnTapSurname = true;
                        setState(() {});
                      },
                      icon: IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {},
                      ),
                      hintText: AppLocalizations.of(context)!.lastname,
                      textEditingController: surnameController,
                      validator: surnameValidator,
                      obSecure: false,
                      border: 1.r,
                      borderColor: isOnTapSurname
                          ? AppStyles.pinkColor
                          : AppStyles.greyColor,
                      borderRadius: 10.r,
                      backgroundColor: AppStyles.trasnparentColor,
                    ),
                    FormFieldWidget(
                      onTap: () {
                        isOnTapEmail = true;
                        setState(() {});
                      },
                      icon: IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {},
                      ),
                      hintText: AppLocalizations.of(context)!.email,
                      textEditingController: emailController,
                      validator: emailValidator,
                      obSecure: false,
                      border: 1.r,
                      borderColor: !isOnTapEmail
                          ? AppStyles.greyColor
                          : isColorRed
                              ? Colors.red
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
                                      color: AppStyles.greyColor,
                                    )
                                  : selectedGender.toLowerCase() == 'female'
                                      ? const Icon(
                                          Icons.female,
                                          color: AppStyles.greyColor,
                                        )
                                      : const Icon(
                                          Icons.transgender,
                                          color: AppStyles.greyColor,
                                        ),
                              txt: selectedGender.isEmpty
                                  ? AppLocalizations.of(context)!
                                      .selectyourgender
                                  : selectedGender,
                              border: 1.r,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SelectGender(
                                      alreadySelected: selectedGender,
                                      callback: (value) {
                                        selectedGender = value;
                                        isGenderEmpty = false;
                                        setState(() {});
                                      },
                                    );
                                  },
                                );
                              },
                              fontWeight: selectedGender.isEmpty
                                  ? FontWeight.w400
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
                              isDateEmpty = false;
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
                                                ? FontWeight.w600
                                                : FontWeight.normal,
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
                    if (isGenderEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Text(
                          'Gender required',
                          style: TextStyle(color: Colors.red, fontSize: 10.sp),
                        ),
                      ),
                    if (isDateEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Date Of Birth required',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                    LocationPicker(
                      countryCallback: (countryName) {
                        countryValue = countryName;
                        isCountryValueEmpty = false;
                        setState(() {});
                      },
                      stateCallback: (stateName) {
                        stateValue = stateName;
                      },
                      cityCallback: (cityName) {
                        cityValue = cityName;
                        locationController.text = cityName;
                      },
                    ),
                    if (isCountryValueEmpty)
                      Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          'Country required',
                          style: TextStyle(color: Colors.red, fontSize: 10.sp),
                        ),
                      ),
                    SizedBox(height: 20.h),
                    GradientBtn(
                      borderRadius: 10.r,
                      height: size.height / 14,
                      txt: AppLocalizations.of(context)!.next,
                      onTap: onSubmit,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                            text: AppLocalizations.of(context)!
                                .alreadyHaveAccount),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginPage.routeName);
                          },
                          child: AppText(
                            text: AppLocalizations.of(context)!.signIn,
                          ),
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
