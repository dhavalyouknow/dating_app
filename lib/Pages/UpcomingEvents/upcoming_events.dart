import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Event/event_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events_handler.dart';
import 'package:dating_app/widget/errorWidget.dart';
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
    BlocProvider.of<EventBloc>(context).add(GetEventList());

    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
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
          child: BlocBuilder<EventBloc, EventState>(
              builder: (context, evenStatus) {
            print(evenStatus);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                  child: AppText(
                    size: 21.sp,
                    text: 'Upcoming events',
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                  ),
                ),
                ...evenStatus.event!.map(
                  (e) {
                    return Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              height: 100.h,
                              width: 100.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: CachedNetworkImage(
                                  height: 100.h,
                                  imageUrl: e.eventPic!.first.url.toString(),
                                  fit: BoxFit.cover,
                                  errorWidget:
                                      (BuildContext context, url, data) {
                                    return const ImageErrorWidget();
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25.w,
                              top: 25.h,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person_outline),
                                    AppText(
                                      size: 16.sp,
                                      text:
                                          "${e.bookedSeat}/${e.totalCapacity} people",
                                      fontFamily: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w600)
                                          .fontFamily,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: AppText(
                    size: 21.sp,
                    text: 'Photos from earlier events',
                    fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.bold)
                        .fontFamily,
                  ),
                ),
                // SizedBox(
                //   height: 200,
                //   child: GridView.builder(
                //     itemCount: evenStatus.event!.length,
                //     gridDelegate:
                //         const SliverGridDelegateWithMaxCrossAxisExtent(
                //       maxCrossAxisExtent: 200,
                //       childAspectRatio: 1 / 1,
                //       crossAxisSpacing: 20,
                //     ),
                //     itemBuilder: (BuildContext context, int index) {
                //       print(evenStatus.event![index].eventPic.toString());
                //       return SizedBox(
                //         height: 152,
                //         width: 152,
                //         child: CachedNetworkImage(
                //           imageUrl:
                //               evenStatus.event![index].eventPic.toString(),
                //           fit: BoxFit.cover,
                //           errorWidget: (BuildContext context, url, data) {
                //             return const ImageErrorWidget();
                //           },
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            );
          }),
        ),
      ),
    );
  }
}
