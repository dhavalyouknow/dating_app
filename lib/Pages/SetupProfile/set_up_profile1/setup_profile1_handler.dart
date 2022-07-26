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
import 'package:numberpicker/numberpicker.dart';

mixin SetupProfile1Handlers<T extends StatefulWidget> on State<T> {
  final TextEditingController lengthController = TextEditingController();
  String selectedStatus = '';
  String selectedInterestedIn = '';
  String selectedOccupation = '';
  String selectedEyeColor = '';
  User? user;
  bool haveDog = false;
  bool haveKids = false;
  int _currentIntValue = 10;
  int _currentHorizontalIntValue = 10;

  final formKey = GlobalKey<FormState>();

  Future<void> selectLength() async {
    await showModalBottomSheet<void>(
      backgroundColor: AppStyles.trasnparentColor,
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Container(
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          height: 300.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  textAlign: TextAlign.center,
                  size: 21.sp,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                      .fontFamily,
                  text: "Select Length",
                ),
                SizedBox(height: 20.h),
                NumberPicker(
                  value: _currentHorizontalIntValue,
                  minValue: 0,
                  maxValue: 100,
                  step: 1,
                  itemHeight: 40,
                  axis: Axis.vertical,
                  onChanged: (value) =>
                      setState(() => _currentHorizontalIntValue = value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
                SizedBox(height: 20.h),
                GradientBtn(
                  borderRadius: 10.r,
                  height: size.height / 14,
                  txt: "Save",
                  onTap: () {
                    onSubmitProfile1();
                  },
                  boxShadow: [
                    BoxShadow(
                      color: AppStyles.shadowColor.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(5, 5), // changes position of shadow
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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

  //
  //   // if (datePicked != null && datePicked != selectedDate) {
  //   //   setState(() {
  //   //     selectedDate = datePicked;
  //   //   });
  //   // }
  // }

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
                    length: int.parse(lengthController.text),
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
