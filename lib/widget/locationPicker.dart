import 'package:csc_picker/csc_picker.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPicker extends StatefulWidget {
  final Function(String) countryCallback;
  final Function(String) stateCallback;
  final Function(String) cityCallback;
  const LocationPicker({
    Key? key,
    required this.countryCallback,
    required this.stateCallback,
    required this.cityCallback,
  }) : super(key: key);

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String countryValue = '';
  String? stateValue;
  String? cityValue;

  List<String> countryHasNoState = [
    "AX",
    "AS",
    "AI",
    "AQ",
    "AW",
    "BV",
    "IO",
    "KY",
    "CX",
    "CC",
    "CK",
    "CW",
    "FK",
    "FO",
    "GF",
    "PF",
    "TF",
    "GI",
    "GL",
    "GP",
    "GU",
    "GG",
    "HM",
    "JE",
    "MO",
    "IM",
    "MQ",
    "YT",
    "MS",
    "NC",
    "NU",
    "NF",
    "MP",
    "PS",
    "PN",
    "RE",
    "SH",
    "PM",
    "BL",
    "MF",
    "SX",
    "GS",
    "SJ",
    "TK",
    "TC",
    "UM",
    "VA",
    "VG",
    "WF",
    "EH",
    "American Samoa",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CSCPicker(
            // disableCountry: true,
            showStates: true,
            showCities: true,
            flagState: CountryFlag.ENABLE,
            dropdownDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(
                color: AppStyles.greyColor,
                width: 1,
              ),
            ),
            disabledDropdownDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(
                color: AppStyles.greyColor,
                width: 1,
              ),
            ),
            countrySearchPlaceholder: "Country",
            stateSearchPlaceholder: "State",
            citySearchPlaceholder: "City",
            countryDropdownLabel:
                countryValue.isNotEmpty ? countryValue : "Select Country",
            stateDropdownLabel: "Select State",
            cityDropdownLabel: "Select City",
            selectedItemStyle: TextStyle(
              fontFamily: GoogleFonts.raleway().fontFamily,
              color: AppStyles.greyColor,
              fontSize: 14,
            ),
            dropdownHeadingStyle: TextStyle(
              fontFamily: GoogleFonts.raleway().fontFamily,
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            dropdownItemStyle: TextStyle(
              fontFamily: GoogleFonts.raleway().fontFamily,
              color: Colors.black,
              fontSize: 14,
            ),
            dropdownDialogRadius: 20.0,
            searchBarRadius: 20.0,
            onCountryChanged: (value) {
              setState(() {
                countryValue = value;
                print(value);
                widget.countryCallback(value);
              });
              if (countryHasNoState.contains(value.toString())) {
                Fluttertoast.showToast(
                    msg: 'Selected Country have not any state and city');
              }
            },
            onStateChanged: (value) {
              setState(() {
                stateValue = value;
                widget.stateCallback(value.toString());
              });
            },
            onCityChanged: (value) {
              // if (value!.isEmpty) {
              //   Fluttertoast.showToast(
              //       msg: 'Selected Country have not any state and city');
              // }
              setState(() {
                cityValue = value;
                widget.cityCallback(value.toString());
              });
            },
          ),
        ),
      ],
    );
  }
}
