import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xFFE76C57);
  static Color mainColor = Color(0xFFF8EEE2);
  static Color accentColor = Colors.blue;

  static List<Color> cardColor = [
    Colors.white,
    Colors.red.shade200,
    Colors.pinkAccent.shade100,
    // Colors.purpleAccent.shade100,
    // Colors.deepPurpleAccent.shade100,
    Colors.indigoAccent.shade100,
    Colors.blueAccent.shade200,
    Colors.lightBlueAccent.shade100,
    Colors.cyanAccent.shade100,
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ); // changed!
  static TextStyle mainContent = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle dateStyle =
      GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w600);
}
