import 'package:admin/core/theme/color.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData data = ThemeData(
    fontFamily: "Montserrat",
    textTheme: const TextTheme(),
    scaffoldBackgroundColor: CustomColor.bgColor,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: CustomColor.borderColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: CustomColor.borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: CustomColor.borderColor,
        ),
      ),
    ),
  );
}
