import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Dialog/AddActivities/add_activities.dart';
import 'package:dating_app/Dialog/AddInterest/add_interests.dart';
import 'package:dating_app/Dialog/FavouriteNight/add_favourite_night.dart';
import 'package:dating_app/Dialog/ImInterestedIn/im_interested_in.dart';
import 'package:dating_app/Dialog/RelationshipStatus/relationship_status.dart';
import 'package:dating_app/Dialog/eyecolor/eyecolor_widget.dart';
import 'package:dating_app/Dialog/occuption/occuptionWidget.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/selected_inerests_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPersonAllField extends StatefulWidget {
  final String alreadySelectedStatus;
  final String alreadySelectedInterestedIn;
  final String alreadySelectedOccupation;
  final String alreadySelectedEyeColor;
  final String alreadyCurrentLength;
  final Function(String) statusCallBack;
  final Function(String) interestedInCallBack;
  final Function(String) occupationCallBack;
  final Function(String) eyeColorCallBack;
  final Function(String) currentLengthCallBack;
  final Function(bool) haveDogCallBack;
  final Function(bool) haveKidCallBack;
  final User? user;
  final Function(List<dynamic>) interestsCallBack;
  final Function(List<dynamic>) nightsCallBack;
  final Function(List<dynamic>) activitiesCallBack;

  const EditPersonAllField({
    Key? key,
    required this.alreadySelectedStatus,
    required this.alreadySelectedInterestedIn,
    required this.alreadySelectedOccupation,
    required this.alreadySelectedEyeColor,
    required this.alreadyCurrentLength,
    required this.statusCallBack,
    required this.interestedInCallBack,
    required this.occupationCallBack,
    required this.eyeColorCallBack,
    required this.currentLengthCallBack,
    required this.haveDogCallBack,
    required this.haveKidCallBack,
    required this.user,
    required this.interestsCallBack,
    required this.nightsCallBack,
    required this.activitiesCallBack,
  }) : super(key: key);

  @override
  State<EditPersonAllField> createState() => _EditPersonAllFieldState();
}

class _EditPersonAllFieldState extends State<EditPersonAllField> {
  String selectedStatus = '';
  String selectedInterestedIn = '';
  String selectedOccupation = '';
  String selectedEyeColor = '';
  String currentLength = '';
  bool haveDog = false;
  bool haveKids = false;
  List<dynamic> interests = [];
  List<dynamic> nights = [];
  List<dynamic> activities = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List interestedName = widget.user!.interests!;
    List favNightName = widget.user!.favouriteNight!;
    List activitiesName = widget.user!.activity!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          text: "Have a dog?",
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            ...isHaveDog.map(
              (e) {
                return Expanded(
                  child: DefaultAppBtn(
                    fontWeight:
                        e.selected ? FontWeight.w700 : FontWeight.normal,
                    height: size.height / 16,
                    border: e.selected ? 3.r : 1.r,
                    borderRadius: 20.r,
                    borderColor:
                        e.selected ? AppStyles.pinkColor : AppStyles.greyColor,
                    txt: e.name,
                    txtColor: AppStyles.blackColor,
                    onTap: () {
                      onHaveDogSubmit(e.name);
                      for (var tapped in isHaveDog) {
                        tapped.selected = false;
                      }
                      e.selected = true;
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 10.h),
        AppText(
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          text: "Relationship Status",
        ),
        SizedBox(height: 10.h),
        DefaultAppBtn(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return RelationshipStatus(
                  callback: (value) {
                    setState(() {
                      selectedStatus = value;
                    });
                  },
                );
              },
            );
            widget.statusCallBack(selectedStatus);
          },
          borderRadius: 20.r,
          height: size.height / 16,
          border: selectedStatus.isEmpty ? 1.r : 3.r,
          borderColor: selectedStatus.isEmpty
              ? AppStyles.greyColor
              : AppStyles.pinkColor,
          txt: selectedStatus.isEmpty
              ? widget.alreadySelectedStatus
              : selectedStatus,
          txtColor: selectedStatus.isEmpty
              ? AppStyles.greyColor
              : AppStyles.blackColor,
          fontWeight:
              selectedStatus.isEmpty ? FontWeight.normal : FontWeight.w700,
        ),
        SizedBox(height: 10.h),
        AppText(
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          text: "I'm Interested In",
        ),
        SizedBox(height: 10.h),
        DefaultAppBtn(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return ImInterestedIn(
                  callback: (value) {
                    setState(() {
                      selectedInterestedIn = value;
                      print(selectedInterestedIn);
                    });
                  },
                );
              },
            );
            widget.interestedInCallBack(selectedInterestedIn);
          },
          fontWeight: selectedInterestedIn.isEmpty
              ? FontWeight.normal
              : FontWeight.w700,
          borderRadius: 20.r,
          height: size.height / 16,
          border: selectedInterestedIn.isEmpty ? 1.r : 3.r,
          borderColor: selectedInterestedIn.isEmpty
              ? AppStyles.greyColor
              : AppStyles.pinkColor,
          txt: selectedInterestedIn.isEmpty
              ? widget.alreadySelectedInterestedIn
              : selectedInterestedIn,
          txtColor: selectedInterestedIn.isEmpty
              ? AppStyles.greyColor
              : AppStyles.blackColor,
        ),
        SizedBox(height: 10.h),
        AppText(
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          text: "Have kids?",
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            ...isHaveKids.map(
              (e) {
                return Expanded(
                  child: DefaultAppBtn(
                    fontWeight:
                        e.selected ? FontWeight.w700 : FontWeight.normal,
                    height: size.height / 16,
                    border: e.selected ? 3.r : 1.r,
                    borderRadius: 20.r,
                    borderColor:
                        e.selected ? AppStyles.pinkColor : AppStyles.greyColor,
                    txt: e.name,
                    txtColor:
                        e.selected ? AppStyles.blackColor : AppStyles.greyColor,
                    onTap: () {
                      onKidSubmit(e.name);
                      for (var tapped in isHaveKids) {
                        tapped.selected = false;
                      }
                      e.selected = true;
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 10.h),
        AppText(
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          text: "Occupation",
        ),
        SizedBox(height: 10.h),
        DefaultAppBtn(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return OccupationWidget(
                  callback: (value) {
                    setState(() {
                      selectedOccupation = value;
                    });
                  },
                );
              },
            );
            widget.occupationCallBack(selectedOccupation);
          },
          fontWeight:
              selectedOccupation.isEmpty ? FontWeight.normal : FontWeight.w700,
          borderRadius: 20.r,
          height: size.height / 16,
          border: selectedOccupation.isEmpty ? 1.r : 3.r,
          borderColor: selectedOccupation.isEmpty
              ? AppStyles.greyColor
              : AppStyles.pinkColor,
          txt: selectedOccupation.isEmpty
              ? widget.alreadySelectedOccupation
              : selectedOccupation,
          txtColor: selectedOccupation.isEmpty
              ? AppStyles.greyColor
              : AppStyles.blackColor,
        ),
        SizedBox(height: 10.h),
        AppText(
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          text: "Eye Colour",
        ),
        SizedBox(height: 10.h),
        DefaultAppBtn(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return EyeColorWidget(
                  callback: (value) {
                    setState(() {
                      selectedEyeColor = value;
                    });
                  },
                );
              },
            );
            widget.eyeColorCallBack(selectedEyeColor);
          },
          fontWeight:
              selectedEyeColor.isEmpty ? FontWeight.normal : FontWeight.w700,
          borderRadius: 20.r,
          height: size.height / 16,
          border: selectedEyeColor.isEmpty ? 1.r : 3.r,
          borderColor: selectedEyeColor.isEmpty
              ? AppStyles.greyColor
              : AppStyles.pinkColor,
          txt: selectedEyeColor.isEmpty
              ? widget.alreadySelectedEyeColor
              : selectedEyeColor,
          txtColor: selectedEyeColor.isEmpty
              ? AppStyles.greyColor
              : AppStyles.blackColor,
        ),
        SizedBox(height: 10.h),
        AppText(
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
          text: "Length (cm)",
        ),
        SizedBox(height: 10.h),
        DefaultAppBtn(
          height: size.height / 16,
          border: 1.r,
          borderRadius: 25.r,
          borderColor: AppStyles.greyColor,
          txt: currentLength.isEmpty
              ? widget.alreadyCurrentLength
              : currentLength,
          txtColor: AppStyles.greyColor,
          onTap: () {
            // selectLength(context);
            widget.currentLengthCallBack('');
          },
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
              text: "Interests",
            ),
            IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddInterests(
                      callback: (value) {
                        interests = value;
                        setState(() {});
                      },
                      alsoSelected: interestedName,
                    );
                  },
                );
                widget.interestsCallBack(interests);
              },
              icon: const Icon(
                Icons.edit,
                color: AppStyles.greyColor,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            ...widget.user!.interests!.map((e) {
              return Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: SelectedChipWidget(
                  interestsName: e,
                ),
              );
            }).toList(),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
              text: "Favourite Night",
            ),
            IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddNightModule(
                      callback: (value) {
                        nights = value;
                        setState(() {});
                      },
                      alsoSelected: favNightName,
                    );
                  },
                );
                widget.nightsCallBack(nights);
              },
              icon: const Icon(
                Icons.edit,
                color: AppStyles.greyColor,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            ...widget.user!.favouriteNight!
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: SelectedChipWidget(
                      interestsName: e,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              fontFamily:
                  GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
              text: "Activities",
            ),
            IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectedActivities(
                      callback: (value) {
                        List<dynamic> activities = value;
                        setState(() {});
                      },
                      alsoSelected: activitiesName,
                    );
                  },
                );
                widget.activitiesCallBack(activities);
              },
              icon: const Icon(
                Icons.edit,
                color: AppStyles.greyColor,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            ...widget.user!.activity!
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: SelectedChipWidget(
                      interestsName: e,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }

  onHaveDogSubmit(String dog) {
    if (dog.toLowerCase() == 'yes') {
      haveDog = true;
    } else {
      haveDog = false;
    }
    widget.haveDogCallBack(haveDog);
  }

  onKidSubmit(String kids) {
    if (kids.toLowerCase() == 'yes') {
      haveKids = true;
    } else {
      haveKids = false;
    }
    widget.haveKidCallBack(haveKids);
  }
}
