import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Pages/BottomBar/bottom_bar.dart';
import 'package:dating_app/Pages/ChattingPage/chattig_page.dart';
import 'package:dating_app/Pages/ChattingPage/chatting_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChattingUserListPage extends StatefulWidget {
  static const routeName = "/ChattingUserListPage";

  const ChattingUserListPage({Key? key}) : super(key: key);

  @override
  State<ChattingUserListPage> createState() => _ChattingUserListPageState();
}

class _ChattingUserListPageState extends State<ChattingUserListPage>
    with ChattingHandlers {
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
                FontAwesomeIcons.ellipsisVertical,
                size: 25.h,
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
          text: 'Messages',
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
        // child: ListView.builder(
        //   itemCount: 5,
        //   shrinkWrap: true,
        //   itemBuilder: (BuildContext context, int index) {
        //     return GestureDetector(
        //       onTap: () {
        //         Navigator.pushNamed(context, ChattingPage.routeName);
        //       },
        //       child: Column(
        //         children: [
        //           const Divider(),
        //           Row(
        //             children: [
        //               Container(
        //                 height: 60.h,
        //                 width: 60.w,
        //                 decoration: BoxDecoration(
        //                   shape: BoxShape.circle,
        //                   border: Border.all(
        //                     color: AppStyles.primaryColor,
        //                     width: 3.w,
        //                   ),
        //                 ),
        //                 child: const CircleAvatar(
        //                   backgroundImage:
        //                       AssetImage("assets/intro/Intro1Background.png"),
        //                 ),
        //               ),
        //               Expanded(
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Padding(
        //                       padding: EdgeInsets.only(left: 10.w),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           AppText(
        //                             size: 16.sp,
        //                             text: 'Indie (Johnny)',
        //                             fontFamily: GoogleFonts.raleway(
        //                                     fontWeight: FontWeight.w800)
        //                                 .fontFamily,
        //                           ),
        //                           AppText(
        //                             size: 15.sp,
        //                             text: 'Fina bilder!',
        //                             fontFamily: GoogleFonts.raleway(
        //                                     fontWeight: FontWeight.w500)
        //                                 .fontFamily,
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                     Column(
        //                       crossAxisAlignment: CrossAxisAlignment.end,
        //                       children: [
        //                         Row(
        //                           children: [
        //                             Icon(
        //                               Icons.favorite,
        //                               color: AppStyles.pinkColor,
        //                               size: 20.sp,
        //                             ),
        //                             AppText(
        //                               color: AppStyles.pinkColor,
        //                               size: 14.sp,
        //                               text: 'Match',
        //                               fontFamily: GoogleFonts.raleway(
        //                                       fontWeight: FontWeight.w500)
        //                                   .fontFamily,
        //                             ),
        //                           ],
        //                         ),
        //                         AppText(
        //                           color: AppStyles.pinkColor,
        //                           size: 13.sp,
        //                           text: '14:55',
        //                           fontFamily: GoogleFonts.raleway(
        //                                   fontWeight: FontWeight.w500)
        //                               .fontFamily,
        //                         ),
        //                       ],
        //                     )
        //                   ],
        //                 ),
        //               )
        //             ],
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
