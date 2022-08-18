// ignore_for_file: use_build_context_synchronously

import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Dialog/UpgradeToPremium/upgrade_to_premium.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/ChattingPage/chat_page.dart';
import 'package:dating_app/Pages/ChattingPage/chatting_user_list.dart';
import 'package:dating_app/Pages/Home/home_page.dart';
import 'package:dating_app/Pages/MyPage/my_page.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, this.selectedItemPosition = 1})
      : super(key: key);
  final int selectedItemPosition;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool clickedCentreFAB = false;
  int selectedIndex = 0;
  String text = "My Page";

  routePage(int index) {
    switch (index) {
      case 0:
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacementNamed(context, MyPage.routeName);
        });
        break;
      case 1:
        Future.delayed(Duration.zero, () {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.routeName, (Route<dynamic> route) => false);
        });
        break;
      case 2:
        BlocProvider.of<UserBloc>(context).add(SetUserInitial());
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacementNamed(context, UpComingEvents.routeName);
        });
        break;
      case 3:
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacementNamed(context, ChatPage.routeName);
        });
        break;
    }
  }

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedItemPosition);
    // return BottomNavigationBar(
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(icon: Icon(Icons.face)),
    //     BottomNavigationBarItem(icon: Icon(Icons.favorite)),
    //     BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_sharp)),
    //   ],
    //   type: BottomNavigationBarType.shifting,
    //   currentIndex: widget.selectedItemPosition,
    //   selectedItemColor: Colors.black,
    //   iconSize: 40,
    //   onTap: routePage,
    //   elevation: 5,
    // );
    return BottomAppBar(
      color: Colors.white,
      child: BlocBuilder<UserBloc, UserState>(builder: (context, userStatus) {
        return Container(
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
                  //Navigator.pushReplacementNamed(context, HomePage.routeName);
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
                onPressed: () async {
                  // updateTabSelection(3, "Message");
                  // if (userStatus.user!.isPro == false) {
                  //   await showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return const UpgradeToPremium();
                  //     },
                  //   );
                  // }
                  // if (userStatus.user!.isPro == true) {
                  //   Navigator.pushReplacementNamed(context, ChatPage.routeName);
                  // }
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
        );
      }),
    );
  }
}
