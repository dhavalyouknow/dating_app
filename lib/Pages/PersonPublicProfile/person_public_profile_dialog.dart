import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/EditPersonProfile/edit_person_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonEditPopup extends StatefulWidget {
  const PersonEditPopup({Key? key}) : super(key: key);

  @override
  State<PersonEditPopup> createState() => _PersonEditPopupState();
}

class _PersonEditPopupState extends State<PersonEditPopup> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Align(
        alignment: Alignment.topRight,
        child: Container(
          height: size.height / 4,
          width: size.width / 2,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          margin: EdgeInsets.only(top: 55.h, right: 5.w),
          decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              TextButton(
                onPressed: () {},
                child: AppText(
                  size: 16.sp,
                  text: "Report User",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                  color: AppStyles.blackColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: AppText(
                  size: 16.sp,
                  text: "Block User",
                  color: AppStyles.crimsonPinkColor,
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, EditPersonProfile.routeName);
                },
                child: AppText(
                  size: 16.sp,
                  text: "Edit User",
                  fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500)
                      .fontFamily,
                  color: AppStyles.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
