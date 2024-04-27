import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:health_car_demo_app/app/constant.dart';

class AppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    splashColor: Consts.primary.shade300.withOpacity(0.05),
    brightness: Brightness.light,
    primaryColor: Consts.primary.shade600,
    hintColor: Consts.hintColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Consts.primary.shade300.withOpacity(0.2),
      selectionColor: Consts.primary.shade300.withOpacity(0.2),
      selectionHandleColor: Consts.primary.shade300.withOpacity(0.2),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF2F4F5),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.urbanist(
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    ),
    // textTheme: GoogleFonts.interTextTheme(
    //   TextTheme(
    //     titleMedium: GoogleFonts.inter(
    //       fontWeight: FontWeight.w600,
    //       fontSize: 18,
    //       color: Consts.backgroundDarkColor,
    //     ),
    //     bodyMedium: GoogleFonts.inter(
    //       fontWeight: FontWeight.w400,
    //       fontSize: 18,
    //       color: Consts.backgroundDarkColor,
    //     ),
    //     bodySmall: GoogleFonts.inter(
    //       fontWeight: FontWeight.w300,
    //       fontSize: 16,
    //       color: const Color(0xFF667085),
    //     ),
    //     labelMedium: GoogleFonts.inter(
    //       fontWeight: FontWeight.w500,
    //       fontSize: 18,
    //       color: Consts.backgroundDarkColor,
    //     ),
    //     labelSmall: GoogleFonts.inter(
    //       fontWeight: FontWeight.w600,
    //       fontSize: 16,
    //       color: Consts.whiteColor,
    //     ),
    //   ),
    // ).apply(
    //   bodyColor: Consts.blackColor,
    //   displayColor: Consts.blackColor,
    // ),
    // iconButtonTheme: const IconButtonThemeData(
    //   style: ButtonStyle(
    //     iconColor: MaterialStatePropertyAll(Consts.backgroundDarkColor),
    //   ),
    // ),
    // iconTheme: const IconThemeData(
    //   color: Consts.backgroundDarkColor,
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStatePropertyAll(Consts.primary.shade300),
    //   // checkColor: MaterialStatePropertyAll(Consts.primary.shade300),
    //   // checkColor: Consts.primary.shade300,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(5),
    //   ),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Consts.hintColor,
      hoverColor: Consts.hintColor,
      fillColor: Colors.grey.shade300,
      filled: true,
      isDense: true,
      isCollapsed: true,
      errorStyle: GoogleFonts.urbanist(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Consts.error.shade700,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: Consts.padding * 1.5,
        horizontal: Consts.margin,
      ),
      hintStyle: GoogleFonts.urbanist(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        color: Consts.hintColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     textStyle: TextStyleT
    // fontFamily: 'Duplet',extTheme().bodyMedium?.copyWith(
    //           fontWeight: FontWeight.w600,
    //           fontSize: 16,
    //         ),
    //     // backgroundColor: Consts.backgroundColor,
    //     foregroundColor: Consts.blackColor,
    //     // shadowColor: Consts.textColor,
    //     side: const BorderSide(
    //       // strokeAlign: 2,
    //       color: Consts.blackColor,
    //     ),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //   ),
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.urbanist(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Consts.margin,
          horizontal: Consts.padding,
        ),
        elevation: 0,
        backgroundColor: Consts.primary,
        surfaceTintColor: Consts.primary,
        disabledBackgroundColor: Consts.primary.shade300,
        shadowColor: Consts.primary,
        foregroundColor: Consts.primary.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}
