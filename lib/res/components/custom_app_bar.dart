import 'package:flutter/material.dart';

import '../colors/app_color.dart';
import 'app_style.dart';
import 'custom_text.dart';

AppBar customAppBar({required String title}){
  return AppBar(
    backgroundColor: AppColors.instance.primaryColor,
    centerTitle: true,
    title:  CustomText(title,style: AppStyles.instance.h1.copyWith(color: AppColors.instance.whitColor),),
    iconTheme: const IconThemeData(
      color: Colors.white, //change your color here
    ),
  );
}