import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle appBarTitle = GoogleFonts.jersey15(
    textStyle: const TextStyle(
      fontSize: 50,
      color: AppColors.primary,
    ),
  );

  static TextStyle displayText = GoogleFonts.jersey15(
    textStyle: const TextStyle(fontSize: 50),
  );

  static TextStyle buttonText = GoogleFonts.jersey15(
    textStyle: const TextStyle(
      fontSize: 40,
      color: AppColors.buttonText,
    ),
  );
}
