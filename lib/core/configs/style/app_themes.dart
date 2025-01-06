import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/configs.dart';

class AppThemes {
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: font,
        primaryColor: JcColors.gs1000,
        fontFamilyFallback: const <String>[
          'Poppins',
          'Furious',
        ],
      );

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: font,
        primaryColor: JcColors.gs300,
        scaffoldBackgroundColor: JcColors.gs300,
        fontFamilyFallback: const <String>[
          'Poppins',
          'Furious',
        ],
        colorScheme: const ColorScheme.light(
          primary: JcColors.gs300,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 6,
          backgroundColor: JcColors.pri500,
        ),
      );
}
