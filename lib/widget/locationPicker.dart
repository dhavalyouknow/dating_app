import 'package:csc_picker/csc_picker.dart';
import 'package:dating_app/Constant/Appstyles/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    "🇦🇽    Aland Islands",
    "🇦🇸    American Samoa",
    "🇦🇮    Anguilla",
    "🇦🇶    Antarctica",
    "🇦🇼    Aruba",
    "🇧🇻    Bouvet Island",
    "🇮🇴    British Indian Ocean Territory",
    "🇰🇾    Cayman Islands",
    "🇨🇽    Christmas Island",
    "🇨🇨    Cocos (Keeling) Islands",
    "🇨🇰    Cook Islands",
    "🇨🇼    Curaçao",
    "🇫🇰    Falkland Islands",
    "🇫🇴    Faroe Islands",
    "🇬🇫    French Guiana",
    "🇵🇫    French Polynesia",
    "🇹🇫    French Southern Territories",
    "🇬🇮    Gibraltar",
    "🇬🇱    Greenland",
    "🇬🇵    Guadeloupe",
    "🇬🇺    Guam",
    "🇬🇬    Guernsey and Alderney",
    "🇭🇲    Heard Island and McDonald Islands",
    "🇯🇪    Jersey",
    "🇲🇴    Macau S.A.R.",
    "🇮🇲    Man (Isle of)",
    "🇲🇶    Martinique",
    "🇾🇹    Mayotte",
    "🇲🇸    Montserrat",
    "🇳🇨    New Caledonia",
    "🇳🇺    Niue",
    "🇳🇫    Norfolk Island",
    "🇲🇵    Northern Mariana Islands",
    "🇵🇸    Palestinian Territory Occupied",
    "🇵🇳    Pitcairn Island",
    "🇷🇪    Reunion",
    "🇵🇲    Saint Pierre and Miquelon",
    "🇧🇱    Saint-Barthelemy",
    "🇲🇫    Saint-Martin (French part)",
    "🇸🇽    Sint Maarten (Dutch part)",
    "🇬🇸    South Georgia",
    "🇸🇯    Svalbard And Jan Mayen Islands",
    "🇹🇰     Tokelau",
    "🇹🇨    Turks And Caicos Islands",
    "🇺🇲    United States Minor Outlying Islands",
    "🇻🇦    Vatican City State (Holy See)",
    "🇻🇬    Virgin Islands (British)",
    "🇼🇫    Wallis And Futuna Islands",
    "🇪🇭    Western Sahara",
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
                color: countryValue.isEmpty
                    ? AppStyles.greyColor
                    : AppStyles.pinkColor,
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
            countryDropdownLabel: AppLocalizations.of(context)!.selectCountry,
            stateDropdownLabel: AppLocalizations.of(context)!.selectState,
            cityDropdownLabel: AppLocalizations.of(context)!.selectCity,
            selectedItemStyle: cityValue == null
                ? TextStyle(
                    fontFamily: GoogleFonts.raleway().fontFamily,
                    fontWeight: FontWeight.w500,
                    color: AppStyles.greyColor,
                    fontSize: 14,
                  )
                : TextStyle(
                    fontFamily: GoogleFonts.raleway().fontFamily,
                    fontWeight: FontWeight.w700,
                    color: AppStyles.blackColor,
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
                if (countryHasNoState.contains(countryValue)) {
                  Fluttertoast.showToast(
                    msg: 'Selected Country have not any state and city',
                    timeInSecForIosWeb: 5,
                  );
                }
              });
            },
            onStateChanged: (value) {
              print(value);
              setState(() {
                stateValue = value;
                widget.stateCallback(value.toString());
              });
            },
            onCityChanged: (value) {
              // if (value!.isEmpty) {
              //   Fluttertoast.showToast(
              //       msg: 'Selected Country have not any state and city',timeInSecForIosWeb: 5,);
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
