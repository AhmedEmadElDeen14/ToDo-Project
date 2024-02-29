import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image(
              image: AssetImage("assets/images/route blue.png"),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Supervised by Mohamed Hamoda",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff5D9CEC),
              ),

            ),
          ),
        ],
      ),
    );
  }
}