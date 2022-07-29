import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Swipe/swipe_state.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../Constant/Apptext/apptext.dart';

class PersonSwiperList extends StatefulWidget {
  final SwipeState swipeState;
  final SwipableStackController? controller;
  bool showImageBig;
  PersonSwiperList(
      {Key? key,
      required this.swipeState,
      required this.controller,
      required this.showImageBig})
      : super(key: key);

  @override
  State<PersonSwiperList> createState() => _PersonSwiperListState();
}

class _PersonSwiperListState extends State<PersonSwiperList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SwipableStack(
      controller: widget.controller,
      itemCount: widget.swipeState.swipe.length,
      swipeAssistDuration: const Duration(milliseconds: 10),
      allowVerticalSwipe: false,
      horizontalSwipeThreshold: 0.8,
      verticalSwipeThreshold: 0.8,
      cancelAnimationCurve: Curves.easeIn,
      builder: (c, p) {
        final itemIndex = p.index % widget.swipeState.swipe.length;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: size.height / 1.8,
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
                        child: widget.showImageBig
                            ? AnimatedContainer(
                                height: size.height / 7,
                                width: size.width / 2.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  gradient: LinearGradient(
                                    colors: AppStyles.myPageGradientColor,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 2),
                                curve: Curves.bounceInOut,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://images.unsplash.com/photo-1501139083538-0139583c060f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGltZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: widget
                                          .swipeState
                                          .swipe[itemIndex]
                                          .squareProfileImage[index]
                                          .url
                                          .toString(),
                                      width: size.width * 0.9,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                                itemCount: widget.swipeState.swipe[itemIndex]
                                    .squareProfileImage.length,
                                scrollDirection: Axis.horizontal,
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                        child: Text(
                          '${widget.swipeState.swipe[itemIndex].firstName} ${widget.swipeState.swipe[itemIndex].lastName}',
                          style: TextStyle(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              size: 15.sp,
                              Icons.location_on_outlined,
                              color: AppStyles.skyBlueColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: AppText(
                                size: 15.sp,
                                text: widget.swipeState.swipe[itemIndex].city,
                                color: AppStyles.greyColor,
                                fontFamily: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                ).fontFamily,
                              ),
                            )
                          ],
                        ),
                      ),
                      if (widget.swipeState.swipe[itemIndex].dog!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                size: 15.sp,
                                Icons.favorite_border,
                                color: AppStyles.pinkColor,
                              ),
                              ...widget.swipeState.swipe[itemIndex].dog!.first
                                  .lookingFor!
                                  .map(
                                    (e) => Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.w,
                                      ),
                                      child: AppText(
                                        text: e,
                                        size: 15.sp,
                                        fontFamily: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w700,
                                        ).fontFamily,
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        ),
                    ],
                  ),
                  //   if (swipeState.swipe[itemIndex].dog.isNotEmpty)
                  Positioned(
                    left: 10.w,
                    bottom: 112.h,
                    child: GestureDetector(
                      onTap: () {
                        if (widget.showImageBig == true) {
                          widget.showImageBig = false;
                        } else {
                          widget.showImageBig = true;
                        }
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        height: size.height / 7,
                        width: size.width / 2.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.0),
                          gradient: LinearGradient(
                            colors: AppStyles.myPageGradientColor,
                          ),
                        ),
                        padding: const EdgeInsets.all(6.0),
                        duration: const Duration(milliseconds: 2),
                        curve: Curves.bounceInOut,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: widget.showImageBig
                              ? CachedNetworkImage(
                                  imageUrl: widget.swipeState.swipe[itemIndex]
                                      .squareProfileImage.first.url
                                      .toString(),
                                  fit: BoxFit.fitHeight,
                                )
                              : CachedNetworkImage(
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1501139083538-0139583c060f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGltZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                  fit: BoxFit.fitHeight,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      onSwipeCompleted: (index, direction) {
        //print('$index, $direction');
      },
    );
  }
}
