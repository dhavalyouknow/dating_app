import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DogPublicProfile extends StatefulWidget {
  const DogPublicProfile({Key? key}) : super(key: key);

  @override
  State<DogPublicProfile> createState() => _DogPublicProfileState();
}

class _DogPublicProfileState extends State<DogPublicProfile> {
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
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppStyles.greyColor,
              size: 30.h,
            ),
          ),
        ),
        backgroundColor: AppStyles.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: "Edit Profile",
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
        ),
      ),
      body: Container(
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
            children:  const [],
          ),
        ),
      ),
    );
  }
}
