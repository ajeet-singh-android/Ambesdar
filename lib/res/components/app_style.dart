import 'package:flutter/material.dart';

import '../assets/image_assets.dart';
import '../colors/app_color.dart';

class AppStyles {
  AppStyles._();

  static final AppStyles instance = AppStyles._();

  // Factory constructor to return the same instance
  factory AppStyles() {
    return instance;
  }

  // Text styles
  TextStyle h1 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: Assets.instance.fontsAbeze);

  TextStyle h2 = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: Assets.instance.fontsAbeze);

  TextStyle h3 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.instance.whitColor,
      fontFamily: Assets.instance.fontsAbeze);

  TextStyle h4 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.instance.whitColor,
      fontFamily: Assets.instance.fontsAbeze);

  TextStyle h5 = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: Colors.black87,
      fontFamily: Assets.instance.fontsAbeze);

  TextStyle h6 = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      fontFamily: Assets.instance.fontsAbeze);

  TextStyle bodyText = TextStyle(
      fontSize: 16,
      color: AppColors.instance.whitColor,
      fontFamily: Assets.instance.fontsAbeze);
}
