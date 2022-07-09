import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/BottomBar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipable_stack/swipable_stack.dart';

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
                color: AppStyles.greyColor,
              ),
            ),
          ),
        ],
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppStyles.greyColor,
              width: 2.r,
            ),
          ),
          margin: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              color: AppStyles.greyColor,
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
              GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SwipableStack(
            //   builder: (context, properties) {
            //     return Image.asset(imagePath);
            //   },
            // ),
            Container(
              height: size.height /1.5,
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 16.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffEDDCC0),
                    blurRadius: 500,
                    spreadRadius: 10,
                    offset: Offset(0, 0.01),
                  ),
                ],
              ),
              child: SwipableStack(

                builder: (c,p){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const  SizedBox(height: 16.0),
                      SizedBox(
                        height: size.height/2.1,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                              ),
                              child: Image.asset(
                                "assets/intro/Intro3Background.png",
                                fit: BoxFit.cover,
                                height: size.height / 2,
                              ),
                            ),
                            Positioned(
                              left: 15.w,
                              bottom: 15.h,
                              child: Container(
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
                              ),
                            )
                          ],
                        ),
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
                            SizedBox(height: 10.h),
                            AppText(
                              size: 21.sp,
                              fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                  .fontFamily,
                              text: "Indie test",
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Icon(
                                  size: 15.sp,
                                  Icons.location_on_outlined,
                                  color: AppStyles.greyColor,
                                ),
                                AppText(
                                  size: 14.sp,
                                  text: "3 kilometers away",
                                  color: AppStyles.greyColor,
                                )
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Icon(
                                  size: 15.sp,
                                  Icons.favorite_border,
                                  color: AppStyles.greyColor,
                                ),
                                AppText(
                                  size: 14.sp,
                                  text: "Friends, Parents, Nanny, Bonus Matte",
                                  color: AppStyles.greyColor,textOverflow: TextOverflow.fade,
                                )
                              ],
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            // SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppStyles.whiteColor,
                        width: 3.w,
                      ),
                      color: AppStyles.lightGreyColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      color: AppStyles.greyColor,
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
                      color: AppStyles.lightGreyColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 35.sp,
                      color: AppStyles.crimsonPinkColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
