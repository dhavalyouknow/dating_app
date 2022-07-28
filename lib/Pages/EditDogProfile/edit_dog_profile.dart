import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Bloc/Auth/auth_bloc.dart';
import 'package:dating_app/Bloc/Dog/dog_bloc.dart';
import 'package:dating_app/Bloc/User/user_bloc.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Constant/Apptext/apptext.dart';
import 'package:dating_app/Model/user.dart';
import 'package:dating_app/Pages/EditDogProfile/edit_dog_handler.dart';
import 'package:dating_app/widget/Button/default_app_btn.dart';
import 'package:dating_app/widget/TextformfieldWidget/edit_formfield.dart';
import 'package:dating_app/widget/editPersonFieldWidget.dart';
import 'package:dating_app/widget/errorWidget.dart';
import 'package:dating_app/widget/selected_inerests_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/Button/gradient_button.dart';

class EditDogProfile extends StatefulWidget {
  static const routeName = '/EditDogProfile';

  const EditDogProfile({Key? key}) : super(key: key);

  @override
  State<EditDogProfile> createState() => _EditDogProfileState();
}

class _EditDogProfileState extends State<EditDogProfile> with EditDogHandlers {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GradientBtn(
          borderRadius: 10.r,
          height: size.height / 14,
          txt: "Save",
          onTap: () {
            BlocProvider.of<DogBloc>(context).add(
              UpdateDogField(
                dogId: dog!.id!,
                dogName: editDogNameController.text,
                gender: editDogGenderController.text,
                size: dogSize,
                lookingFor: isdogLookingFor,
                onSuccess: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    SessionRequest(
                      onSuccess: (User user) {
                        BlocProvider.of<UserBloc>(context).add(
                          SetUser(user: user),
                        );
                        Fluttertoast.showToast(
                            msg: 'Your dog has been updated..');
                        Navigator.pushReplacementNamed(context, '/MyPage');
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: Icon(
                size: 30.h,
                Icons.close,
                color: AppStyles.greyColor,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppStyles.greyColor,
              size: 30.h,
            ),
          ),
        ),
        backgroundColor: AppStyles.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: AppText(
          size: 18.sp,
          text: "Edit dog profile",
          fontFamily:
              GoogleFonts.raleway(fontWeight: FontWeight.w700).fontFamily,
        ),
      ),
      body: Container(
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
              SizedBox(
                height: 350.h,
                child: PageView.builder(
                  itemCount: dog!.squareProfileImage!.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: dog?.squareProfileImage != null
                          ? dog!.squareProfileImage!.first.url.toString()
                          : "",
                      fit: BoxFit.cover,
                      errorWidget: (BuildContext context, url, data) {
                        return const ImageErrorWidget();
                      },
                      placeholder: (context, url) => Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey.withOpacity(0.1),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppStyles.textColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.camera_alt_outlined),
                          SizedBox(width: 10.w),
                          AppText(
                            size: 18.sp,
                            fontFamily:
                                GoogleFonts.raleway(fontWeight: FontWeight.w700)
                                    .fontFamily,
                            text: "Add Picture",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    EditPersonFieldWidget(
                      name: 'Dog Name',
                      container: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        height: size.width * 0.08,
                        width: size.width / 1.5,
                        child: TextFormField(
                          controller: editDogNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Dog name',
                          ),
                        ),
                      ),
                    ),
                    EditPersonFieldWidget(
                      name: 'Gender',
                      container: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        height: size.width * 0.08,
                        width: size.width / 1.5,
                        child: TextFormField(
                          controller: editDogGenderController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'gender',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    AppText(
                      text: 'Size',
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                      size: 17.sp,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      runSpacing: 10.w,
                      children: [
                        ...sizeOfDog.map(
                          (e) {
                            return DefaultAppBtn(
                              fontWeight: e.name == dogSize || e.selected
                                  ? FontWeight.w700
                                  : FontWeight.normal,
                              height: size.height * 0.05,
                              width: size.width / 4,
                              border:
                                  e.name == dogSize || e.selected ? 3.r : 1.r,
                              borderRadius: 25.r,
                              borderColor: e.name == dogSize || e.selected
                                  ? AppStyles.pinkColor
                                  : AppStyles.greyColor,
                              txt: e.name,
                              txtColor: e.name == dogSize || e.selected
                                  ? AppStyles.blackColor
                                  : AppStyles.greyColor,
                              onTap: () {
                                for (var tapped in sizeOfDog) {
                                  tapped.selected = false;
                                }
                                e.selected = true;
                                dogSize = e.name;
                                setState(() {});
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    AppText(
                      text: 'My dog is looking for',
                      fontFamily:
                          GoogleFonts.raleway(fontWeight: FontWeight.w700)
                              .fontFamily,
                      size: 17.sp,
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      runSpacing: 10.w,
                      children: [
                        ...dogLookingFor.map(
                          (e) {
                            return DefaultAppBtn(
                              fontWeight: isdogLookingFor.contains(e.name)
                                  ? FontWeight.normal
                                  : FontWeight.w700,
                              height: size.height * 0.05,
                              width: size.width / 4,
                              border:
                                  isdogLookingFor.contains(e.name) ? 1.r : 2.r,
                              borderRadius: 25.r,
                              borderColor: isdogLookingFor.contains(e.name)
                                  ? AppStyles.greyColor
                                  : AppStyles.pinkColor,
                              txt: e.name,
                              txtColor: isdogLookingFor.contains(e.name)
                                  ? AppStyles.greyColor
                                  : AppStyles.blackColor,
                              onTap: () {
                                if (isdogLookingFor.contains(e.name)) {
                                  isdogLookingFor.remove(e.name);
                                } else {
                                  isdogLookingFor.add(e.name);
                                }
                                setState(() {});
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
