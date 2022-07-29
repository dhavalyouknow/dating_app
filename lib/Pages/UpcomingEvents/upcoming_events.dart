import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Event/event_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events_detail.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events_handler.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UpComingEvents extends StatefulWidget {
  static const routeName = "/UpComingEvents";

  const UpComingEvents({Key? key}) : super(key: key);

  @override
  State<UpComingEvents> createState() => _UpComingEventsState();
}

class _UpComingEventsState extends State<UpComingEvents>
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
            children: [
              BlocBuilder<EventBloc, EventState>(
                builder: (context, evenStatus) {
                  print(evenStatus);
                  if (evenStatus.event != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: AppText(
                            size: 18.sp,
                            text: "Upcoming Events",
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.bold)
                                    .fontFamily,
                          ),
                        ),
                        ...evenStatus.event!.map(
                          (e) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  UpComingEventsDetail.routeName,
                                  arguments: e,
                                );
                              },
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5.h),
                                        height: 70.h,
                                        width: 70.w,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          child: CachedNetworkImage(
                                            imageUrl: e.eventPic!.first.url
                                                .toString(),
                                            fit: BoxFit.cover,
                                            errorWidget: (BuildContext context,
                                                url, data) {
                                              return const ImageErrorWidget();
                                            },
                                            placeholder: (context, url) =>
                                                const LoadingWidget(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10.w,
                                        top: 10.h,
                                        child: AppText(
                                          size: 24.sp,
                                          textAlign: TextAlign.center,
                                          text: DateFormat('dd\nMMMM').format(
                                            DateTime.parse("${e.eventDate}"),
                                          ),
                                          fontFamily: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w600)
                                              .fontFamily,
                                          color: AppStyles.whiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          size: 16.sp,
                                          text: e.title.toString(),
                                          fontFamily: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w600)
                                              .fontFamily,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                            vertical: 5.h,
                                          ),
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                            color: AppStyles.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.person_outline),
                                              AppText(
                                                size: 16.sp,
                                                text:
                                                    "${e.bookedSeat}/${e.totalCapacity} people",
                                                fontFamily: GoogleFonts.raleway(
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    .fontFamily,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return const LoadingWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
