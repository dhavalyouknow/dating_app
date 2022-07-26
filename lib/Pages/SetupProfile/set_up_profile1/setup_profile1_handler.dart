import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile2/setup_profile2.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

mixin SetupProfile1Handlers<T extends StatefulWidget> on State<T> {
  final TextEditingController lengthController = TextEditingController();
  String selectedStatus = '';
  String selectedInterestedIn = '';
  String selectedOccupation = '';
  String selectedEyeColor = '';
  User? user;
  bool haveDog = false;
  bool haveKids = false;
  final items = List<String>.generate(151, (index) => '$index');

  String currentLength = '';

  final formKey = GlobalKey<FormState>();

  String? lengthValidator(dynamic length) {
    if (length.isEmpty) {
      return 'Enter Length';
    }
    return null;
  }

  onHaveDogSubmit(String dog) {
    if (dog.toLowerCase() == 'yes') {
      haveDog = true;
    } else {
      haveDog = false;
    }
  }

  onKidSubmit(String kids) {
    if (kids.toLowerCase() == 'yes') {
      haveKids = true;
    } else {
      haveKids = false;
    }
  }

  Future<void> selectLength(BuildContext context) async {
    final items = List<String>.generate(151, (index) => '$index');
    showModalBottomSheet(
      backgroundColor: AppStyles.trasnparentColor,
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Container(
          height: 230.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: AppText(
                      size: 15.sp,
                      text: "Cancel",
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w500)
                              .fontFamily,
                    ),
                  ),
                  AppText(
                    size: 20.sp,
                    text: "Select Length",
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w700)
                        .fontFamily,
                  ),
                  AppText(
                    text: currentLength,
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                        .fontFamily,
                    size: 20.sp,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 5.h, bottom: 10),
                height: 130,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 20.h,
                      child: Container(
                        height: 40.h,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppStyles.greyColor,
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ...items
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentLength = e;
                                    });
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: AppText(
                                      text: e,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GradientBtn(
                borderRadius: 10.r,
                height: size.height / 14,
                txt: "Save",
                onTap: () {
                  setState(() {});
                  print(currentLength);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  onSubmitProfile1() {
    if (formKey.currentState!.validate()) {
      if (user == null) {
        BlocProvider.of<AuthBloc>(context).add(
          SessionRequest(
            onSuccess: (user) {
              BlocProvider.of<UserBloc>(context).add(
                UpdateUserEvent(
                  user: user.copyWith(
                    haveDog: haveDog,
                    relationshipStatus: selectedStatus,
                    interestedIn: selectedInterestedIn,
                    occupation: selectedOccupation,
                    eyeColor: selectedEyeColor,
                    haveKids: haveKids,
                    length: int.parse(currentLength),
                  ),
                  success: (value) {
                    Navigator.pushNamed(context, SetupProfile2.routeName);
                    Fluttertoast.showToast(
                        msg: 'Your Profile Setup Successfully');
                  },
                ),
              );
            },
          ),
        );
      }
    }
  }
}
