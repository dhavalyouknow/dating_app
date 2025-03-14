import 'package:dating_app/Bloc/DogSwipe/dog_swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_state.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/UpgradeToPremium/upgrade_to_premium.dart';
import 'package:dating_app/Pages/BottomBar/bottom_bar.dart';
import 'package:dating_app/Pages/Home/home_page_handler.dart';
import 'package:dating_app/Pages/MyPage/my_page.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:dating_app/widget/swiperCatelog/dogSwiperList.dart';
import 'package:dating_app/widget/swiperCatelog/personSwiperList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      const MyPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Settings");
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
              color: onSwitchDog
                  ? const Color(0xffF7BFAE)
                  : AppStyles.skyBlueColor,
              width: 2.r,
            ),
          ),
          margin: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
          child: IconButton(
            onPressed: () {
              onDogSwipe();
            },
            icon: onSwitchDog
                ? ImageIcon(
                    color: const Color(0xffF7BFAE),
                    size: 30.h,
                    const AssetImage("assets/icons/PetIcon.png"),
                  )
                : ImageIcon(
                    color: AppStyles.skyBlueColor,
                    size: 30.h,
                    const AssetImage("assets/icons/Vector.png"),
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
      body: BlocBuilder<DogSwipeBloc, DogSwipeState>(
        builder: (context, dogState) {
          return BlocBuilder<SwipeBloc, SwipeState>(
            builder: (context, swipeState) {
              if (swipeState.status == SwipeStatus.loading) {
                return const LoadingWidget();
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.h),
                      height: size.height / 1.6,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: onSwitchDog
                                ? const Color(0xffEDDCC0)
                                : AppStyles.skyBlueColor,
                            blurRadius: 500,
                            spreadRadius: 10,
                            offset: const Offset(0, 0.01),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 35.h,
                              left: 31.w,
                              right: 31.w,
                            ),
                            height: size.height / 1.8,
                            decoration: BoxDecoration(
                              color: onSwitchDog
                                  ? const Color(0xffEDDCC0)
                                  : AppStyles.skyBlueColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onSwitchDog
                              ? DogSwiperList(
                                  dogSwipes: dogSwipe,
                                  swipes: swipe,
                                  controller: dogSwipeController,
                                  showImageBig: showImageBig,
                                  pageNo: dogPageNo,
                                  onPageNo: (no) {
                                    dogPageNo = no;
                                  },
                                )
                              : PersonSwiperList(
                                  swipes: swipe,
                                  showImageBig: showImageBig,
                                  controller: swipeController,
                                  pageNo: pageNo,
                                  onPageNo: (no) {
                                    pageNo = no;
                                  },
                                ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (BlocProvider.of<UserBloc>(context)
                                    .state
                                    .user!
                                    .isPro ==
                                false) {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return const UpgradeToPremium();
                                },
                              );
                            } else {
                              if (onSwitchDog) {
                                disLikeDog(dogState);
                              } else {
                                disLikePerson(swipeState);
                              }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
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
                          onTap: () async {
                            if (BlocProvider.of<UserBloc>(context)
                                    .state
                                    .user!
                                    .isPro ==
                                false) {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return const UpgradeToPremium();
                                },
                              );
                            } else {
                              if (onSwitchDog) {
                                likeDog(dogState);
                              } else {
                                likePerson(swipeState);
                              }
                            }
                          },
                          child: Container(
                            height: 70.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppStyles.whiteColor,
                                width: 3.w,
                              ),
                              color: AppStyles.pinkColor,
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
              );
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
