import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppStyles {
  static const Color primaryColor = Color(0xffCEEFFF);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color textColor = Color(0xffAFAFAF);
  static const Color greyColor = Color(0xffAFAFAF);
  static const Color lightGreyColor = Color(0xffEAEAEA);
  static const Color rosyWhiteColor = Color(0xffFFFEFE);
  static const Color redColor = Color(0xffFF0000);
  static const Color skyBlueColor = Color(0xffB5E9FF);
  static const Color normalBlueColor = Color(0xffCEEFFF);
  static const Color pinkColor = Color(0xffFAC7D1);
  static const Color lightPinkColor = Color(0xffFFE5EA);
  static const Color crimsonPinkColor = Color(0xffFF4C6F);
  static const Color trasnparentColor = Colors.transparent;
  static const Color shadowColor = Color(0xffC71585);
  static const Color placeholder = Color(0xff9B9B9B);
  static const Color beigeColor = Color(0xffEDDCC0);

  static List<Color> premiumPageGradientColor = [
    const Color(0xff47B3E7),
    const Color(0xffB6E4FA),
  ];

  static List<Color> myPageGradientColor = [
    const Color(0xffEDDCC0),
    const Color(0xffF7BFAE),
  ];

  static List<Color> pinkGradientColor = [
    const Color(0xffFFBCC9),
    const Color(0xffFAC7D1),
    const Color(0xffFFE3E9),
  ];

  static List<Color> forgotPassGradientColor = [
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF),
    const Color(0xffB6E4FA),
  ];
  static List<Color> introGradientColor = [
    // const Color(0xffFFFFFF),
    // const Color(0xffFFFFFF),
    // const Color(0xffFFFFFF),
    // const Color(0xffFFFFFF),
    const Color(0xffFFFFFF),
    const Color(0xffB6E4FA),
  ];
}

List<String> interestList = [
  "Blog",
  "Audiobook",
  "Music",
  "Trip",
  "Shopping",
  "Cooking",
  "Brunch",
  "TV Game",
  "Dog Lovers",
  "Wine Tasting",
  "Vlog",
  "Agility",
  "Fashion",
  "Crafts",
  "Vernissage",
  "Photographing",
  "Books",
  "Dog Park",
  "Cava",
  "Nature",
  "Poddar",
  "Film",
  "Policy",
  "Social media",
  "Exercise",
  "Road Trips",
  "Discover Dog Restaurants",
  "Home Decoration",
  "Food Lovers",
  "Dog Clothes",
];

List<String> occupation = [
  'Working',
  'Influencer',
  'Studying',
  'Between jobs',
  'Entrepreneur',
  'Freelancer',
  'Pensioner',
  'Other'
];

class YesNo {
  String name;
  bool selected;

  YesNo({required this.name, required this.selected});
}

List<YesNo> isHaveDog = [
  YesNo(name: 'Yes', selected: false),
  YesNo(name: 'No', selected: false),
  YesNo(name: 'wish I hade', selected: false),
];

List<YesNo> isHaveKids = [
  YesNo(name: 'Yes', selected: false),
  YesNo(name: 'No', selected: false),
  YesNo(name: 'bonus', selected: false),
];

// For RelationShip Popup

// For InterestGender Popup Border

class InterestGender {
  String interest;
  bool selected;

  InterestGender({required this.interest, required this.selected});
}

// For Gender Selection

class MaleFemale {
  String name;
  bool selected;
  Icon icon;

  MaleFemale({
    required this.name,
    required this.selected,
    required this.icon,
  });
}

// For Dog Size

class DogSize {
  String name;
  bool selected;

  DogSize({required this.name, required this.selected});
}

List<DogSize> sizeOfDog = [
  DogSize(name: "Big", selected: false),
  DogSize(name: "Medium", selected: false),
  DogSize(name: "Small", selected: false),
  DogSize(name: "Mini", selected: false),
  DogSize(name: "Micro", selected: false),
];

List<DogSize> dogLookingFor = [
  DogSize(name: "Friends", selected: false),
  DogSize(name: "Nanny", selected: false),
  DogSize(name: "Bonus Father", selected: false),
  DogSize(name: "Bonus Mother", selected: false),
];

class ChoosePartner {
  String name;
  bool selected;
  Image image;

  ChoosePartner({
    required this.name,
    required this.selected,
    required this.image,
  });
}
