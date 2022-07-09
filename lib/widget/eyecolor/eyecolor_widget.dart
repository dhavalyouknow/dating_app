import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/Pages/SetupProfile/setup_profile1/setup_profile1_handler.dart';
import 'package:dating_app/widget/eyecolor/eyecolor_handler.dart';
import 'package:flutter/material.dart';

class EyeColorWidget extends StatefulWidget {
  final Function(String) callback;
  const EyeColorWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<EyeColorWidget> createState() => _EyeColorWidgetState();
}

class _EyeColorWidgetState extends State<EyeColorWidget> with EyeColorHandlers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          mainAxisExtent: 50,
        ),
        itemCount: eyeColor.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedEyeColor = eyeColor[index];
                print(selectedEyeColor);
                widget.callback(selectedEyeColor);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: Text(
                  eyeColor[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
