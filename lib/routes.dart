import 'package:dating_app/Dialog/Match/matching.dart';
import 'package:dating_app/Dialog/UpgradeToPremium/upgrade_to_premium.dart';
import 'package:dating_app/OtherLogin/otherlogin_createacccount.dart';
import 'package:dating_app/Pages/About/about.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog.dart';
import 'package:dating_app/Pages/AddYourDog/add_your_dog_dialog.dart';
import 'package:dating_app/Pages/BecomeAPremium/become_premium.dart';
import 'package:dating_app/Pages/CheckMail/edit_email.dart';
import 'package:dating_app/Pages/ChooseDogPicture/choose_dog_picture.dart';
import 'package:dating_app/Pages/ChooseDogPicture/CropDogPicture/choose_dog_picture2.dart';
import 'package:dating_app/Pages/ChoosePartner/choose_partner.dart';
import 'package:dating_app/Pages/CreateAccount/create_account.dart';
import 'package:dating_app/Pages/CreatePassword/create_password.dart';
import 'package:dating_app/Pages/CheckMail/check_email.dart';
import 'package:dating_app/Pages/AccountRecovery/account_recovery.dart';
import 'package:dating_app/Pages/DogPublicProfile/dog_public_profile.dart';
import 'package:dating_app/Pages/EditDogProfile/edit_dog_profile.dart';
import 'package:dating_app/Pages/EditPersonProfile/edit_person_profile.dart';
//import 'package:dating_app/Pages/EditPersonProfile/edit_person_profile.dart';
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
import 'package:dating_app/Pages/UploadProfile/upload_profile.dart';
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
  '/SecondIntroPage': (ctx) => const SecondIntroPage(),
  '/ThirdIntroPage': (ctx) => const ThirdIntroPage(),
  '/SetupProfile1': (ctx) => const SetupProfile1(),
  '/SetupProfile2': (ctx) => const SetupProfile2(),
  '/SetupProfile3': (ctx) => const SetupProfile3(),
  '/AddYourDog': (ctx) => const AddYourDog(),
  '/AddYourDogNow': (ctx) => const AddYourDogNow(),
  '/ChooseDogPicture': (ctx) => const ChooseDogPicture(),
  '/ChooseDogPicture2': (ctx) => const ChooseDogPicture2(),
  '/HomePage': (ctx) => const HomePage(),
  '/MyPage': (ctx) => const MyPage(),
  '/Settings': (ctx) => const Settings(),
  '/About': (ctx) => const About(),
  '/UpgradeToPremium': (ctx) => const UpgradeToPremium(),
  '/Matching': (ctx) => const Matching(),
  '/SwipeSetting': (ctx) => const SwipeSetting(),
  '/BecomePremium': (ctx) => const BecomePremium(),
  EditDogProfile.routeName: (ctx) => const EditDogProfile(),
  EditPersonProfile.routeName: (ctx) => const EditPersonProfile(),
  '/DogPublicProfile': (ctx) => const DogPublicProfile(),
  PersonPublicProfile.routeName: (ctx) => const PersonPublicProfile(),
  '/OtherLoginCreateAccount': (ctx) => const OtherLoginCreateAccount(),
  LoginPage.routeName: (ctx) => const LoginPage(
        key: Key('/LoginPage'),
      ),
};
