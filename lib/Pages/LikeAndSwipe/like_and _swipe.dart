import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Swipe/swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_state.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipable_stack/swipable_stack.dart';

class LikeAndSwipe extends StatefulWidget {
  const LikeAndSwipe({Key? key}) : super(key: key);

  @override
  State<LikeAndSwipe> createState() => _LikeAndSwipeState();
}

class _LikeAndSwipeState extends State<LikeAndSwipe> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<SwipeBloc, SwipeState>(
      builder: (context, swipeState) {
        print(swipeState.swipe.length);
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height / 1.4,
                // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.0),
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
                  // controller: swipeController,
                  itemCount: swipeState.swipe.length,
                  swipeAssistDuration: const Duration(milliseconds: 10),
                  allowVerticalSwipe: true,
                  horizontalSwipeThreshold: 0.8,
                  verticalSwipeThreshold: 0.8,
                  cancelAnimationCurve: Curves.easeIn,
                  builder: (c, p) {
                    final itemIndex = p.index % swipeState.swipe.length;
                    print('itemIndex ==> $itemIndex');
                    // print(swipeState.swipe[itemIndex].circleProfileImage?.url);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16.0),
                        SizedBox(
                          height: size.height / 2.1,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                                // child: CachedNetworkImage(
                                //   imageUrl: swipeState.swipe[itemIndex]
                                //       .squareProfileImage!.first.url
                                //       .toString(),
                                // ),

                                child: Image.asset(
                                  "assets/intro/Intro3Background.png",
                                  fit: BoxFit.cover,
                                  height: size.height / 2,
                                ),
                              ),
                              // Positioned(
                              //   left: 15.w,
                              //   bottom: 15.h,
                              //   child: Container(
                              //     height: size.height / 6,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(15.r),
                              //       border: Border.all(
                              //         width: 5.r,
                              //         color: AppStyles.primaryColor,
                              //       ),
                              //     ),
                              //     child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(15.r),
                              //       child: CachedNetworkImage(
                              //         imageUrl: swipeState.swipe[itemIndex]
                              //                     .circleProfileImage !=
                              //                 null
                              //             ? swipeState.swipe[itemIndex]
                              //                 .circleProfileImage!.url
                              //                 .toString()
                              //             : "",
                              //         errorWidget:
                              //             (BuildContext context, url, data) {
                              //           return const Icon(Icons.person);
                              //         },
                              //       ),
                              //       // child: Image.asset(
                              //       //     "assets/intro/Person.png"),
                              //     ),
                              //   ),
                              // )
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
                          margin: EdgeInsets.symmetric(horizontal: 17.w),
                          padding: EdgeInsets.symmetric(horizontal: 10.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              AppText(
                                size: 21.sp,
                                fontFamily: GoogleFonts.raleway(
                                        fontWeight: FontWeight.bold)
                                    .fontFamily,
                                text:
                                    '${swipeState.swipe[itemIndex].firstName} ${swipeState.swipe[itemIndex].lastName}',
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
                                    text:
                                        "Friends, Parents, Nanny, Bonus Matte",
                                    color: AppStyles.greyColor,
                                    textOverflow: TextOverflow.fade,
                                  )
                                ],
                              ),
                              const SizedBox(height: 9.0),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 40.w),
                        //   height: 10.h,
                        //   decoration: BoxDecoration(
                        //     color: AppStyles.whiteColor,
                        //   ),
                        // )
                      ],
                    );
                  },
                  onSwipeCompleted: (index, direction) {
                    print('$index, $direction');
                  },
                ),
              ),
              // SizedBox(height: 5.0),
              GestureDetector(
                onTap: () {
                  // swipeController.next(
                  //   swipeDirection: SwipeDirection.right,
                  // );
                },
                child: Container(
                  color: Colors.red,
                  height: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
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
        );
      },
    );
  }
}
