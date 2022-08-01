import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Pages/ChattingPage/chatting_user_list.dart';
import 'package:dating_app/Pages/Home/home_page.dart';
import 'package:dating_app/Pages/MyPage/my_page.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool clickedCentreFAB = false;
  int selectedIndex = 0;
  String text = "My Page";

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 50.h,
        margin: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                updateTabSelection(0, "My Page");
                Navigator.pushReplacementNamed(context, MyPage.routeName);
              },
              icon: Icon(
                size: 27.sp,
                Icons.face,
                color: selectedIndex == 0
                    ? AppStyles.pinkColor
                    : AppStyles.greyColor,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(1, "Like");
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              icon: Icon(
                size: 27.sp,
                Icons.favorite,
                color: selectedIndex == 1
                    ? AppStyles.pinkColor
                    : AppStyles.greyColor,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(2, "Events");
                // Navigator.pushReplacementNamed(
                //     context, UpComingEvents.routeName);
              },
              icon: Icon(
                size: 24.sp,
                FontAwesomeIcons.martiniGlass,
                color: selectedIndex == 2
                    ? AppStyles.pinkColor
                    : AppStyles.greyColor,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(3, "Message");
                // Navigator.pushReplacementNamed(
                //     context, ChattingUserListPage.routeName);
              },
              icon: Icon(
                size: 27.sp,
                Icons.chat_bubble_sharp,
                color: selectedIndex == 3
                    ? AppStyles.pinkColor
                    : AppStyles.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
