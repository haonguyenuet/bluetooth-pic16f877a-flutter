import 'package:bluetooth_control/configs/app_size.dart';
import 'package:flutter/material.dart';
import 'package:bluetooth_control/constants/app_color.dart';

class AppFont {
  static final regular = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  static final medium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  static final bold = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  //regular
  static final regular_default = regular.copyWith(color: AppColor.textColor);
  static final regular_default_16 =
      regular_default.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final regular_default_18 =
      regular_default.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final regular_default_20 =
      regular_default.copyWith(fontSize: SizeConfig.defaultSize * 2);

  static final regular_primary = regular.copyWith(color: AppColor.primaryColor);
  static final regular_primary_16 =
      regular_primary.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final regular_primary_18 =
      regular_primary.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final regular_primary_20 =
      regular_primary.copyWith(fontSize: SizeConfig.defaultSize * 2);

  static final regular_white = regular.copyWith(color: AppColor.white);
  static final regular_white_16 =
      regular_white.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final regular_white_18 =
      regular_white.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final regular_white_20 =
      regular_white.copyWith(fontSize: SizeConfig.defaultSize * 2);

  //medium (SEMIbold)
  static final medium_default = medium.copyWith(color: AppColor.textColor);
  static final medium_default_16 =
      medium_default.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final medium_default_18 =
      medium_default.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final medium_default_20 =
      medium_default.copyWith(fontSize: SizeConfig.defaultSize * 2);

  static final medium_primary = medium.copyWith(color: AppColor.primaryColor);
  static final medium_primary_16 =
      medium_primary.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final medium_primary_18 =
      medium_primary.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final medium_primary_20 =
      medium_primary.copyWith(fontSize: SizeConfig.defaultSize * 2);
  static final medium_primary_24 =
      medium_primary.copyWith(fontSize: SizeConfig.defaultSize * 2.4);

  static final medium_white = medium.copyWith(color: AppColor.white);
  static final medium_white_16 =
      medium_white.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final medium_white_18 =
      medium_white.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final medium_white_20 =
      medium_white.copyWith(fontSize: SizeConfig.defaultSize * 2);

  //bold
  static final bold_default = bold.copyWith(color: AppColor.textColor);
  static final bold_default_16 =
      bold_default.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final bold_default_18 =
      bold_default.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final bold_default_20 =
      bold_default.copyWith(fontSize: SizeConfig.defaultSize * 2);
  static final bold_default_24 =
      bold_default.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final bold_default_26 =
      bold_default.copyWith(fontSize: SizeConfig.defaultSize * 2.6);

  static final bold_primary = bold.copyWith(color: AppColor.primaryColor);
  static final bold_primary_16 =
      bold_primary.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final bold_primary_18 =
      bold_primary.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final bold_primary_20 =
      bold_primary.copyWith(fontSize: SizeConfig.defaultSize * 2);
  static final bold_primary_24 =
      bold_primary.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final bold_primary_26 =
      bold_primary.copyWith(fontSize: SizeConfig.defaultSize * 2.6);

  static final bold_white = bold.copyWith(color: AppColor.white);
  static final bold_white_16 =
      bold_white.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final bold_white_18 =
      bold_white.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final bold_white_20 =
      bold_white.copyWith(fontSize: SizeConfig.defaultSize * 2);
  static final bold_white_26 =
      bold_white.copyWith(fontSize: SizeConfig.defaultSize * 2.6);
  static final bold_white_32 =
      bold_white.copyWith(fontSize: SizeConfig.defaultSize * 3.2);

  ///Singleton factory
  static final AppFont _instance = AppFont._internal();

  factory AppFont() {
    return _instance;
  }

  AppFont._internal();
}
