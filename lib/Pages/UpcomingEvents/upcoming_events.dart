import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Event/event_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/BottomBar/bottom_bar.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events_detail.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events_handler.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      bottomNavigationBar: const BottomNavBar(),
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
          text: AppLocalizations.of(context)!.mingle,
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
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: searchController,
                              style:
                                  const TextStyle(color: AppStyles.blackColor),
                              decoration: InputDecoration(
                                hintText: 'Search Events',
                                hintStyle: TextStyle(
                                  color: AppStyles.placeholder,
                                  fontSize: 12.sp,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppStyles.textColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppStyles.textColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppStyles.whiteColor,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 15.w,
                                ),
                                filled: true,
                                fillColor: AppStyles.whiteColor,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppStyles.textColor,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                showWhenOpen = true;
                                if (value.isEmpty) {
                                  isNotShowList = true;
                                } else {
                                  isNotShowList = false;
                                  BlocProvider.of<EventBloc>(context).add(
                                    SearchEvent(
                                      searchText: value,
                                      onSuccess: (searchEvent) {
                                        print(searchEvent);
                                      },
                                    ),
                                  );
                                }
                                setState(() {});
                              },
                            ),
                            if (showWhenOpen &&
                                searchController.text.isNotEmpty)
                              Container(
                                decoration: const BoxDecoration(
                                    color: AppStyles.whiteColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showWhenOpen = false;
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.close),
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
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.h),
                                                    height: 70.h,
                                                    width: 70.w,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r),
                                                      child: CachedNetworkImage(
                                                        imageUrl: e
                                                            .eventPic!.first.url
                                                            .toString(),
                                                        fit: BoxFit.cover,
                                                        errorWidget:
                                                            (BuildContext
                                                                    context,
                                                                url,
                                                                data) {
                                                          return const ImageErrorWidget();
                                                        },
                                                        placeholder: (context,
                                                                url) =>
                                                            const LoadingWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 10.w,
                                                    top: 10.h,
                                                    child: AppText(
                                                      size: 24.sp,
                                                      textAlign:
                                                          TextAlign.center,
                                                      text:
                                                          DateFormat('dd\nMMMM')
                                                              .format(
                                                        DateTime.parse(
                                                            "${e.eventDate}"),
                                                      ),
                                                      fontFamily:
                                                          GoogleFonts.raleway(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      color:
                                                          AppStyles.whiteColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AppText(
                                                      size: 16.sp,
                                                      text: e.title.toString(),
                                                      fontFamily:
                                                          GoogleFonts.raleway(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 5.w,
                                                        vertical: 5.h,
                                                      ),
                                                      height: 30.h,
                                                      decoration: BoxDecoration(
                                                        color: AppStyles
                                                            .primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const Icon(Icons
                                                              .person_outline),
                                                          AppText(
                                                            size: 16.sp,
                                                            text:
                                                                "${e.bookedSeat}/${e.totalCapacity} people",
                                                            fontFamily: GoogleFonts.raleway(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)
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
                                ),
                              )
                            else
                              Container(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: AppText(
                                size: 18.sp,
                                text: AppLocalizations.of(context)!
                                    .upComingEvents,
                                fontFamily: GoogleFonts.raleway(
                                        fontWeight: FontWeight.bold)
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
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            height: 70.h,
                                            width: 70.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              child: CachedNetworkImage(
                                                imageUrl: e.eventPic!.first.url
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                errorWidget:
                                                    (BuildContext context, url,
                                                        data) {
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
                                              text:
                                                  DateFormat('dd\nMMMM').format(
                                                DateTime.parse(
                                                    "${e.eventDate}"),
                                              ),
                                              fontFamily: GoogleFonts.raleway(
                                                      fontWeight:
                                                          FontWeight.w600)
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
                                                      fontWeight:
                                                          FontWeight.w600)
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
                                                  const Icon(
                                                      Icons.person_outline),
                                                  AppText(
                                                    size: 16.sp,
                                                    text:
                                                        "${e.bookedSeat}/${e.totalCapacity} people",
                                                    fontFamily:
                                                        GoogleFonts.raleway(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)
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
