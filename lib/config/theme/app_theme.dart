import 'package:flutter/material.dart';

const Color customBlue = Color(0xFF003f72);
const Color customYellow = Color(0xFFeaab00);

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: customBlue,
    );
  }
}
