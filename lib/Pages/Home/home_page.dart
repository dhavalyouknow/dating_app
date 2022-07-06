import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppStyles.btnColor,
              width: 2.r,
            ),
          ),
          margin: EdgeInsets.only(left: 10.w, top: 10.h),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              color: AppStyles.btnColor,
              size: 30.h,
              const AssetImage("assets/icons/PetIcon.png"),
            ),
          ),
        ),
        backgroundColor: AppStyles.trasnparentColor,
        elevation: 0.0,
        centerTitle: true,
        title: AppText(
            size: 18.sp,
            text: "Swipe",
            fontFamily:
                GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffFAC7D1),
                      blurRadius: 50,
                      spreadRadius: 10,
                      offset: Offset(1, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          child:
                              Image.asset("assets/intro/Intro3Background.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: size.height / 3,
                            left: size.width / 16,
                          ),
                          height: size.height / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                              width: 5.r,
                              color: AppStyles.primaryColor,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.asset("assets/intro/Person.png"),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppStyles.whiteColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          AppText(
                            size: 21.sp,
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                    .fontFamily,
                            text: "Indie",
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppStyles.btnColor,
                              ),
                              AppText(
                                text: "3 kilometers away",
                                color: AppStyles.btnColor,
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite_border,
                                color: AppStyles.btnColor,
                              ),
                              AppText(
                                text: "Friends, Parents, Nanny, Bonus Matte",
                                color: AppStyles.btnColor,
                              )
                            ],
                          ),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Container(
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffEDDCC0),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppStyles.whiteColor,
                          width: 3.w,
                        ),
                        color: AppStyles.btnColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 35.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppStyles.whiteColor,
                          width: 3.w,
                        ),
                        color: AppStyles.btnColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 35.sp,
                        color: AppStyles.redColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
