import 'package:flutter/material.dart';

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

  static List<Color> premiumPageGradientColor = [
    const Color(0xff47B3E7),
    const Color(0xffB6E4FA),
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

List<String> favouriteNight = [
  'Friday Cosiness',
  'Meet Friends',
  'Hang Out With The Family',
  'Thank you tonight',
  'Hundmingel',
  'Eating Out (Restrictions)',
  'Youtube',
  'Concert',
  'Cinema',
  'Nightlife & Party',
  'Check Out The Series',
  'Opera / Theatre',
  'Read Books',
  'Bar / Pub',
  'Go To A Concert',
  'Take A Glass',
  'Dinner Parties',
  'Spotyevermang',
  'Event',
  'Karaoke',
];

List<String> occupation = [
  'Working',
  'Influencer',
  'Studying',
  'Between',
  'Jobs',
  'Entrepreneur',
  'Freelancer',
  'Pensioner',
  'Other'
];

List<String> eyeColor = [
  'Brown',
  'Blue',
  'Hazel',
  'Honey',
  'Green',
  'Gray',
];

List<String> activity = [
  'Yoga',
  'Padel',
  'Bike Ride With The Dog',
  'Walk',
  'Golf',
  'Dance',
  'Motocross',
  'Tennis',
  'Go By Boat',
  'Skating',
  'Dog Paddle',
  'Running',
  'Riding',
  'Jogging Trip With The Dog',
  'Work Out At A Gym',
  'Hiking',
  'Motorsport',
  'Hunting',
  'Diving',
  'Parachuting',
  'Mediation',
  'Surfing',
  'Fishing',
  'Football',
  'Climbing',
  'Swimming',
  'Skiing / Snowboarding',
  'Paddle Board',
  'Badminton',
  'Hockey',
];

class YesNo {
  String name;
  bool selected;

  YesNo({required this.name, required this.selected});
}

List<YesNo> isHaveDog = [
  YesNo(name: 'Yes', selected: false),
  YesNo(name: 'No', selected: false),
];

List<YesNo> isHaveKids = [
  YesNo(name: 'Yes', selected: false),
  YesNo(name: 'No', selected: false),
];

// For RelationShip Popup Border

class SingleMingle {
  String status;
  bool selected;

  SingleMingle({required this.status, required this.selected});
}

List<SingleMingle> relationShip = [
  SingleMingle(status: "Single", selected: false),
  SingleMingle(status: "Mingle", selected: false),
];

// For InterestGender Popup Border

class InterestGender {
  String interest;
  bool selected;

  InterestGender({required this.interest, required this.selected});
}

List<InterestGender> interestedIn = [
  InterestGender(interest: "Men", selected: false),
  InterestGender(interest: "Women", selected: false),
  InterestGender(interest: "Other", selected: false),
];

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

List<MaleFemale> selectGender = [
  MaleFemale(
    name: "Male",
    selected: false,
    icon: const Icon(Icons.male),
  ),
  MaleFemale(
    name: "Female",
    selected: false,
    icon: const Icon(Icons.female),
  ),
  MaleFemale(
    name: "Other",
    selected: false,
    icon: const Icon(Icons.transgender),
  ),
];

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
  DogSize(name: "Love", selected: false),
  DogSize(name: "Bonus Husse", selected: false),
];
