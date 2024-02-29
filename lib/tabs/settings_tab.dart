import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String langActive = "English";
  String modeActive = "Light";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Language",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff5D9CEC)),
            ),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: DropdownButton(
              items: <String>['English','Arabic']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5D9CEC),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  langActive = newValue!;
                });
              },
              value: "$langActive",
              icon: Icon(Icons.arrow_drop_down),
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff5D9CEC)),
              underline: Container(),
              dropdownColor: Colors.white,
              iconDisabledColor: Color(0xff5D9CEC),
              iconEnabledColor: Color(0xff5D9CEC),
              isExpanded: true,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Mode",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xff5D9CEC)),
            ),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: DropdownButton(
              items: <String>['Light', 'Dark']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  modeActive = newValue!;
                });
              },
              value: modeActive,
              icon: Icon(Icons.arrow_drop_down),
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff5D9CEC)),
              underline: Container(),
              dropdownColor: Colors.white,
              iconDisabledColor: Color(0xff5D9CEC),
              iconEnabledColor: Color(0xff5D9CEC),
              isExpanded: true,
            ),
          ),
        ],
      ),
    );
  }
}
