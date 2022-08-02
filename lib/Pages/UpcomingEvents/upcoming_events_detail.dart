import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events_handler.dart';
import 'package:dating_app/widget/Button/gradient_button.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UpComingEventsDetail extends StatefulWidget {
  static const routeName = "/UpComingEventsDetail";

  const UpComingEventsDetail({Key? key}) : super(key: key);

  @override
  State<UpComingEventsDetail> createState() => _UpComingEventsDetailState();
}

class _UpComingEventsDetailState extends State<UpComingEventsDetail>
    with UpComingEventsHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                size: 30.h,
                Icons.close,
                color: AppStyles.greyColor,
              ),
            ),
          ),
        ],
        backgroundColor: AppStyles.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: 'Mingle',
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.bold).fontFamily,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350.h,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: event?.eventPic?.length,
                      itemBuilder: (context, i) {
                        return CachedNetworkImage(
                          imageUrl: event!.eventPic![i].url != null
                              ? event!.eventPic![i].url.toString()
                              : "",
                          fit: BoxFit.cover,
                          errorWidget: (BuildContext context, url, data) {
                            return const ImageErrorWidget();
                          },
                          placeholder: (context, url) => const LoadingWidget(),
                        );
                      },
                    ),
                    Positioned(
                      left: 25.w,
                      bottom: 25.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            textAlign: TextAlign.start,
                            size: 22.sp,
                            text: "${event!.title} \n${event!.subTitle}",
                            color: AppStyles.whiteColor,
                            fontFamily: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                            ).fontFamily,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          ImageIcon(
                            const AssetImage("assets/icons/CalendarIcon.png"),
                            size: 20.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: AppText(
                              size: 16.sp,
                              text: DateFormat('dd MMMM yyyy').format(
                                DateTime.parse("${event!.eventDate}"),
                              ),
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 23.sp),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: AppText(
                              size: 16.sp,
                              text: event!.location.toString(),
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          ImageIcon(
                            const AssetImage("assets/icons/ClockIcon.png"),
                            size: 20.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: AppText(
                              size: 16.sp,
                              text: "${event!.time}",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.addressCard, size: 20.sp),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: AppText(
                              size: 16.sp,
                              text:
                                  "Recommended age range ${event!.recommendedAge}",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700)
                                  .fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: AppStyles.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.person_outline),
                                AppText(
                                  size: 16.sp,
                                  text:
                                      "${event!.bookedSeat}/${event!.totalCapacity} people",
                                  fontFamily: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w600)
                                      .fontFamily,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 5.h,
                            ),
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: AppStyles.lightPinkColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: AppText(
                              size: 16.sp,
                              text: "${event!.price} SEK",
                              fontFamily: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600)
                                  .fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 5.h,
                        ),
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: event!.isInside == true
                              ? AppStyles.beigeColor
                              : AppStyles.lightGreyColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: AppText(
                          size: 16.sp,
                          text: event!.isInside == true ? "Inside" : "Outside",
                          fontFamily:
                              GoogleFonts.raleway(fontWeight: FontWeight.w600)
                                  .fontFamily,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: AppText(
                        size: 16.sp,
                        text: event!.desc.toString(),
                        fontFamily:
                            GoogleFonts.raleway(fontWeight: FontWeight.w600)
                                .fontFamily,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 3,
                      child: GradientBtn(
                        borderRadius: 12.r,
                        height: size.height / 16,
                        txt: "Attend",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: size.width / 3,
                      child: GradientBtn(
                        borderRadius: 12.r,
                        height: size.height / 16,
                        txt: "Cancel",
                        onTap: () {},
                      ),
                    ),
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
