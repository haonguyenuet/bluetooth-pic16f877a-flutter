import 'package:flutter/material.dart';
import 'package:bluetooth_control/constants/app_color.dart';
import 'package:bluetooth_control/constants/app_font.dart';

import 'app_size.dart';

class AppTheme {
  static final ThemeData currentTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    fontFamily: "Roboto",
    appBarTheme: _appBarTheme,
    textTheme: _textTheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: _inputDecorationThem,
  );

  static final _appBarTheme = AppBarTheme(
    color: Colors.white,
    shadowColor: AppColor.cardShadowColor,
    elevation: 0.4,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: AppColor.textColor),
    actionsIconTheme: IconThemeData(color: AppColor.textColor),
    centerTitle: true,
    textTheme: TextTheme(headline6: AppFont.bold_default_18),
  );

  static final _textTheme = TextTheme(
    bodyText1: TextStyle(color: AppColor.textColor),
    bodyText2: TextStyle(color: AppColor.textColor),
  );

  static final _inputDecorationThem = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: AppColor.textColor),
    ),
  );

  /// Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}
