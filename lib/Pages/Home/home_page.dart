import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Swipe/swipe_bloc.dart';
import 'package:dating_app/Bloc/Swipe/swipe_state.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/BottomBar/bottom_bar.dart';
import 'package:dating_app/Pages/ChattingPage/chatting_user_list.dart';
import 'package:dating_app/Pages/Home/home_page_handler.dart';
import 'package:dating_app/Pages/MyPage/my_page.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipable_stack/swipable_stack.dart';

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
      const UpComingEvents(),
      const ChattingUserListPage(),
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
              color: AppStyles.greyColor,
              width: 2.r,
            ),
          ),
          margin: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
          child: IconButton(
            onPressed: () {},
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
      body: BlocBuilder<SwipeBloc, SwipeState>(
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
                    controller: swipeController,
                    itemCount: swipeState.swipe.length,
                    swipeAssistDuration: const Duration(milliseconds: 10),
                    allowVerticalSwipe: false,
                    horizontalSwipeThreshold: 0.8,
                    verticalSwipeThreshold: 0.8,
                    cancelAnimationCurve: Curves.easeIn,
                    builder: (c, p) {
                      final itemIndex = p.index % swiper.length;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16.0),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            height: size.height / 2.1,
                            width: size.width * 2,
                            decoration: BoxDecoration(
                              color: AppStyles.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: size.width * 2,
                                      height: size.height * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ListView.builder(
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: swipeState
                                                  .swipe[itemIndex]
                                                  .squareProfileImage[index]
                                                  .url
                                                  .toString(),
                                              width: size.width * 0.9,
                                              fit: BoxFit.fitHeight,
                                              placeholder: (context, url) =>
                                                  const LoadingWidget(),
                                            ),
                                          );
                                        },
                                        shrinkWrap: true,
                                        itemCount: swipeState.swipe[itemIndex]
                                            .squareProfileImage.length,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     ...swipeState
                                    //         .swipe[itemIndex].squareProfileImage
                                    //         .map(
                                    //           (e) => CachedNetworkImage(
                                    //             imageUrl: e.url.toString(),
                                    //             height: 100,
                                    //             width: 200,
                                    //           ),
                                    //         )
                                    //         .toList(),
                                    //   ],
                                    // ),
                                    Text(
                                        '${swipeState.swipe[itemIndex].firstName} ${swipeState.swipe[itemIndex].lastName}'),
                                    Row(
                                      children: [
                                        Icon(
                                          size: 15.sp,
                                          Icons.location_on_outlined,
                                          color: AppStyles.greyColor,
                                        ),
                                        AppText(
                                          size: 14.sp,
                                          text:
                                              swipeState.swipe[itemIndex].city,
                                          color: AppStyles.greyColor,
                                        )
                                      ],
                                    ),
                                    if (swipeState
                                        .swipe[itemIndex].dog.isNotEmpty)
                                      Row(
                                        children: [
                                          Icon(
                                            size: 15.sp,
                                            Icons.favorite_border,
                                            color: AppStyles.greyColor,
                                          ),
                                          ...swipeState.swipe[itemIndex].dog
                                              .first.lookingFor!
                                              .map((e) => AppText(text: e))
                                              .toList()
                                        ],
                                      ),
                                  ],
                                )
                              ],
                            ),
                            // child: Stack(
                            //   children: [
                            //     ClipRRect(
                            //       borderRadius: BorderRadius.only(
                            //         topLeft: Radius.circular(20.r),
                            //         topRight: Radius.circular(20.r),
                            //       ),
                            //       child: CachedNetworkImage(
                            //         imageUrl: swipeState.swipe[itemIndex]
                            //             .squareProfileImage.first.url
                            //             .toString(),
                            //         fit: BoxFit.fitHeight,
                            //       ),
                            //     ),
                            //     if (swipeState.swipe[itemIndex].dog.isNotEmpty)
                            //       Positioned(
                            //         left: 15.w,
                            //         bottom: 15.h,
                            //         child: Container(
                            //           height: size.height / 6,
                            //           decoration: BoxDecoration(
                            //             borderRadius:
                            //                 BorderRadius.circular(10.r),
                            //             border: Border.all(
                            //               width: 5.r,
                            //               color: AppStyles.primaryColor,
                            //             ),
                            //           ),
                            //           child: ClipRRect(
                            //             borderRadius:
                            //                 BorderRadius.circular(5.r),
                            //             child: CachedNetworkImage(
                            //               imageUrl: swipeState
                            //                   .swipe[itemIndex]
                            //                   .dog
                            //                   .first
                            //                   .squareProfileImage!
                            //                   .first
                            //                   .url
                            //                   .toString(),
                            //               errorWidget: (BuildContext context,
                            //                   url, data) {
                            //                 return Container(
                            //                   width: size.height / 7.5,
                            //                   color: AppStyles.greyColor,
                            //                   child: Icon(
                            //                     Icons.person,
                            //                     size: 80.sp,
                            //                     color: AppStyles.whiteColor,
                            //                   ),
                            //                 );
                            //               },
                            //             ),
                            //           ),
                            //         ),
                            //       )
                            //   ],
                            // ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: AppStyles.whiteColor,
                          //     borderRadius: BorderRadius.only(
                          //       bottomLeft: Radius.circular(20.r),
                          //       bottomRight: Radius.circular(20.r),
                          //     ),
                          //   ),
                          //   margin: EdgeInsets.symmetric(horizontal: 33.w),
                          //   padding: EdgeInsets.symmetric(
                          //     horizontal: 10.r,
                          //     vertical: 10.h,
                          //   ),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       SizedBox(height: 10.h),
                          //       AppText(
                          //         size: 21.sp,
                          //         fontFamily: GoogleFonts.raleway(
                          //                 fontWeight: FontWeight.bold)
                          //             .fontFamily,
                          //         text:
                          //             '${swipeState.swipe[itemIndex].firstName} ${swipeState.swipe[itemIndex].lastName}',
                          //       ),
                          //       SizedBox(height: 10.h),
                          //       Row(
                          //         children: [
                          //           Icon(
                          //             size: 15.sp,
                          //             Icons.location_on_outlined,
                          //             color: AppStyles.greyColor,
                          //           ),
                          //           AppText(
                          //             size: 14.sp,
                          //             text: swipeState.swipe[itemIndex].city,
                          //             color: AppStyles.greyColor,
                          //           )
                          //         ],
                          //       ),
                          //       SizedBox(height: 10.h),
                          //       if (swipeState.swipe[itemIndex].dog.isNotEmpty)
                          //         Row(
                          //           children: [
                          //             Icon(
                          //               size: 15.sp,
                          //               Icons.favorite_border,
                          //               color: AppStyles.greyColor,
                          //             ),
                          //             ...swipeState.swipe[itemIndex].dog.first
                          //                 .lookingFor!
                          //                 .map((e) => AppText(text: e))
                          //                 .toList()
                          //           ],
                          //         ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      );
                    },
                    onSwipeCompleted: (index, direction) {
                      print('$index, $direction');
                    },
                  ),
                ),
                // SizedBox(height: 5.0),
                // GestureDetector(
                //   onTap: () {
                //     swipeController.next(
                //       swipeDirection: SwipeDirection.right,
                //     );
                //   },
                //   child: Container(
                //     color: Colors.red,
                //     height: 50,
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        swipeController.next(
                          swipeDirection: SwipeDirection.left,
                        );
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
                      onTap: () {
                        swipeController.next(
                          swipeDirection: SwipeDirection.right,
                        );
                      },
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
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
