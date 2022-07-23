import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CSCPicker(
            showStates: true,
            showCities: true,
            flagState: CountryFlag.ENABLE,
            dropdownDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            disabledDropdownDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 1),
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
              color: Colors.black,
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
                widget.countryCallback(value);
              });
            },
            onStateChanged: (value) {
              setState(() {
                stateValue = value;
                widget.stateCallback(value.toString());
              });
            },
            onCityChanged: (value) {
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
