import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPersonProfile extends StatefulWidget {
  const EditPersonProfile({Key? key}) : super(key: key);

  @override
  State<EditPersonProfile> createState() => _EditPersonProfileState();
}

class _EditPersonProfileState extends State<EditPersonProfile> {
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
            children: [
              Image.asset("assets/intro/Person.png"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.close,
                                color: AppStyles.crimsonPinkColor,
                              ),
                              SizedBox(width: 5.w),
                              AppText(
                                color: AppStyles.crimsonPinkColor,
                                size: 18.sp,
                                fontFamily: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w700)
                                    .fontFamily,
                                text: "Remove",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.w),
                        InkWell(
                          child: Row(
                            children: [
                              const Icon(Icons.camera_alt_outlined),
                              SizedBox(width: 5.w),
                              AppText(
                                size: 18.sp,
                                fontFamily: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w700)
                                    .fontFamily,
                                text: "Replace",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.w),
                        InkWell(
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.penToSquare,
                                size: 16.sp,
                              ),
                              SizedBox(width: 5.w),
                              AppText(
                                size: 18.sp,
                                fontFamily: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w700)
                                    .fontFamily,
                                text: "Edit",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              size: 18.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                              text: "Name",
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              size: 14.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500)
                                  .fontFamily,
                              text: "Eveline Martinsson",
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              size: 18.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                              text: "About",
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              size: 14.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500)
                                  .fontFamily,
                              text: "Lorem ipsum dolor sit amet, consectetur",
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              size: 18.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                              text: "Age",
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              size: 14.sp,
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500)
                                  .fontFamily,
                              text: "36 y/o",
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
