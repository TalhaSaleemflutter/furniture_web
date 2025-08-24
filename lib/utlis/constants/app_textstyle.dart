import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/theme/theme_helper.dart';

class AppTextStyles {
  static TextStyle authHeadingText0(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: ThemeHelper.getWhiteBlack(context),
      fontSize: 6.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle mobAuthHeadingText0(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: ThemeHelper.getWhiteBlack(context),
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle authHeadingText1(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: ThemeHelper.getWhiteBlack(context),
      fontSize: 8.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle mobAuthHeadingText1(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: ThemeHelper.getWhiteBlack(context),
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle authHeadingText2(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: ThemeHelper.getWhiteBlack(context),
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle mobAuthHeadingText2(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: ThemeHelper.getWhiteBlack(context),
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle mobAuthHeadingText3(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: ThemeHelper.getWhiteBlack(context),
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyText0(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.normal,
      fontSize: 2.sp,
    );
  }

  static TextStyle bodyText1(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.normal,
      fontSize: 3.sp,
      height: 1.4.h,
    );
  }

  static TextStyle mobBodyText1(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.normal,
      fontSize: 8.sp,
      height: 2.h,
    );
  }

  static TextStyle bodyText2(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.normal,
      fontSize: 4.sp,
      //height: 1.4.h,
    );
  }

  static TextStyle mobBodyText2(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.normal,
      fontSize: 10.sp,
      height: 1.3.h,
    );
  }

  static TextStyle bodyText3(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.normal,
      fontSize: 5.sp,
    );
  }

  static TextStyle mobBodyText3(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontSize: 12.sp,
    );
  }

  static TextStyle bodyText4(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.normal,
      fontSize: 6.sp,
    );
  }

  static TextStyle mobBodyText4(BuildContext context) {
    return TextStyle(
      fontFamily: 'Mulish',
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontSize: 14.sp,
    );
  }
}
