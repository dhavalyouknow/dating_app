import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
                Icons.settings,
                color: AppStyles.btnColor,
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
              color: AppStyles.btnColor,
              size: 30.h,
            ),
          ),
        ),
        backgroundColor: AppStyles.trasnparentColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: "My Page",
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
        ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              AppText(
                size: 18.sp,
                text: "My Profile",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/intro/Person.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        size: 18.sp,
                        text: "Eveline Martinsson",
                        fontFamily:
                            GoogleFonts.raleway(fontWeight: FontWeight.w600)
                                .fontFamily,
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 16),
                          AppText(
                            size: 14.sp,
                            text: "Stockholm",
                            fontFamily: GoogleFonts.raleway().fontFamily,
                          )
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width / 7,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15.w,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2,
                                            color: AppStyles.btnColor)),
                                    child: CircleAvatar(
                                      radius: 12.r,
                                      backgroundImage: const AssetImage(
                                          "assets/intro/Intro3Background.png"),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2, color: AppStyles.btnColor)),
                                  child: CircleAvatar(
                                    radius: 12.r,
                                    backgroundImage: const AssetImage(
                                        "assets/intro/Intro3Background.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          AppText(
                            size: 14.sp,
                            text: "2 Dogs",
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                    .fontFamily,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              AppText(
                size: 18.sp,
                text: "My Dogs",
                fontFamily:
                    GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/intro/Intro3Background.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        size: 18.sp,
                        text: "Indie",
                        fontFamily:
                            GoogleFonts.raleway(fontWeight: FontWeight.w600)
                                .fontFamily,
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 16),
                          AppText(
                            size: 14.sp,
                            text: "Stockholm",
                            fontFamily: GoogleFonts.raleway().fontFamily,
                          )
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2, color: AppStyles.btnColor)),
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundImage: const AssetImage(
                                  "assets/intro/Person.png"),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          AppText(
                            size: 14.sp,
                            text: "Eveline Martinsson",
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                    .fontFamily,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: size.width / 4,
                child: GradientBtn(
                  height: size.height / 16,
                  txt: "Add Dog",
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
