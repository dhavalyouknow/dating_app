import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:dating_app/widget/occuption/occuption_handller.dart';
import 'package:flutter/material.dart';

class OccupationWidget extends StatefulWidget {
  final Function(String) callback;
  const OccupationWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<OccupationWidget> createState() => _OccupationWidgetState();
}

class _OccupationWidgetState extends State<OccupationWidget>
    with OccuptionHandlers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.trasnparentColor,
      body: Container(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            mainAxisExtent: 50,
          ),
          itemCount: occupation.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedOccupation = occupation[index];
                  widget.callback(selectedOccupation);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    occupation[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
