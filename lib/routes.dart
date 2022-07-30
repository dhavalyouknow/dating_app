// ignore_for_file: equal_keys_in_map

import 'package:dating_app/Dialog/Match/matching.dart';
import 'package:dating_app/Dialog/UpgradeToPremium/upgrade_to_premium.dart';
import 'package:dating_app/OtherLogin/otherlogin_createacccount.dart';
import 'package:dating_app/Pages/About/about.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog_dialog.dart';
import 'package:dating_app/Pages/BecomeAPremium/become_premium.dart';
import 'package:dating_app/Pages/ChattingPage/chattig_page.dart';
import 'package:dating_app/Pages/ChattingPage/chatting_user_list.dart';
import 'package:dating_app/Pages/EditEmail/edit_email.dart';
import 'package:dating_app/Pages/ChooseDogPicture/choose_dog_picture.dart';
import 'package:dating_app/Pages/ChooseDogPicture/CropDogPicture/choose_dog_picture2.dart';
import 'package:dating_app/Pages/ChoosePartner/choose_partner.dart';
import 'package:dating_app/Pages/CreateAccount/create_account.dart';
import 'package:dating_app/Pages/CreatePassword/create_password.dart';
import 'package:dating_app/Pages/CheckMail/check_email.dart';
import 'package:dating_app/Pages/AccountRecovery/account_recovery.dart';
import 'package:dating_app/Pages/DogPublicProfile/dog_public_profile.dart';
import 'package:dating_app/Pages/EditDogProfile/edit_dog_profile.dart';
import 'package:dating_app/Pages/EditEmail/enter_email.dart';
import 'package:dating_app/Pages/EditPersonProfile/edit_person_profile.dart';
import 'package:dating_app/Pages/ForgetPassword/reset_password.dart';
import 'package:dating_app/Pages/Home/home_page.dart';
import 'package:dating_app/Pages/Intro/first_intro_page.dart';
import 'package:dating_app/Pages/Intro/second_intro_page.dart';
import 'package:dating_app/Pages/Intro/third_intro_page.dart';
import 'package:dating_app/Pages/Login/login_page.dart';
import 'package:dating_app/Pages/Login/select_login_method.dart';
import 'package:dating_app/Pages/MyPage/my_page.dart';
import 'package:dating_app/Pages/PersonPublicProfile/person_public_profile.dart';
import 'package:dating_app/Pages/Setting/setting.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile1/setup_profile1.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile2/setup_profile2.dart';
import 'package:dating_app/Pages/SetupProfile/set_up_profile3/setup_profile3.dart';
import 'package:dating_app/Pages/SwipeSettings/swipe_settings.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events.dart';
import 'package:dating_app/Pages/UpcomingEvents/upcoming_events_detail.dart';
import 'package:dating_app/Pages/UploadProfile/upload_profile.dart';
import 'package:dating_app/widget/splash.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (ctx) => const LoginPage(),
  SelectLoginMethod.routeName: (ctx) => const SelectLoginMethod(),
  AccountRecovery.routeName: (ctx) => const AccountRecovery(),
  CheckEmail.routeName: (ctx) => const CheckEmail(),
  ResetPassword.routeName: (ctx) => const ResetPassword(),
  CreateAccount.routeName: (ctx) => const CreateAccount(),
  ChoosePartner.routeName: (ctx) => const ChoosePartner(),
  UploadProfile.routeName: (ctx) => const UploadProfile(),
  CreatePassword.routeName: (ctx) => const CreatePassword(),
  EditEmail.routeName: (ctx) => const EditEmail(),
  FirstIntroPage.routeName: (ctx) => const FirstIntroPage(),
  SecondIntroPage.routeName: (ctx) => const SecondIntroPage(),
  ThirdIntroPage.routeName: (ctx) => const ThirdIntroPage(),
  SetupProfile1.routeName: (ctx) => const SetupProfile1(),
  SetupProfile2.routeName: (ctx) => const SetupProfile2(),
  SetupProfile3.routeName: (ctx) => const SetupProfile3(),
  AddYourDog.routeName: (ctx) => const AddYourDog(),
  AddYourDogNow.routeName: (ctx) => const AddYourDogNow(),
  ChooseDogPicture.routeName: (ctx) => const ChooseDogPicture(),
  ChooseDogPicture2.routeName: (ctx) => const ChooseDogPicture2(),
  HomePage.routeName: (ctx) => const HomePage(),
  MyPage.routeName: (ctx) => const MyPage(),
  Settings.routeName: (ctx) => const Settings(),
  About.routeName: (ctx) => const About(),
  UpgradeToPremium.routeName: (ctx) => const UpgradeToPremium(),
  Matching.routeName: (ctx) => const Matching(),
  SwipeSetting.routeName: (ctx) => const SwipeSetting(),
  BecomePremium.routeName: (ctx) => const BecomePremium(),
  EditDogProfile.routeName: (ctx) => const EditDogProfile(),
  EditPersonProfile.routeName: (ctx) => const EditPersonProfile(),
  DogPublicProfile.routeName: (ctx) => const DogPublicProfile(),
  PersonPublicProfile.routeName: (ctx) => const PersonPublicProfile(),
  OtherLoginCreateAccount.routeName: (ctx) => const OtherLoginCreateAccount(),
  SplashScreen.routeName: (ctx) => const SplashScreen(),
  LoginPage.routeName: (ctx) => const LoginPage(
        key: Key('/LoginPage'),
      ),
  OtherLoginCreateAccount.routeName: (ctx) => const OtherLoginCreateAccount(),
  UpComingEvents.routeName: (ctx) => const UpComingEvents(),
  UpComingEventsDetail.routeName: (ctx) => const UpComingEventsDetail(),
  ChattingUserListPage.routeName: (ctx) => const ChattingUserListPage(),
  ChattingPage.routeName: (ctx) => const ChattingPage(),
  EditUserEmail.routeName: (ctx) => const EditUserEmail(),
};
