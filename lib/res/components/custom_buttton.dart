import 'package:flutter/material.dart';

import '../../main.dart';
import '../assets/image_assets.dart';
import '../colors/app_color.dart';
import 'app_style.dart';


class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.name,required this.onClick});

  String name;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onClick,
        style: ElevatedButton.styleFrom(
            shape:   RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(51.0),
            ),
            backgroundColor: AppColors.instance.primaryColor
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: rheight*.013),
          child: Text(name,style: AppStyles.instance.h2.copyWith(color: AppColors.instance.whitColor,fontSize: 15),),
        ),),

    );
  }
}

class NormalButton extends StatelessWidget {
  NormalButton({super.key,required this.name,required this.onClick});

  String name;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onClick,
        style: ElevatedButton.styleFrom(
            shape:   RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            backgroundColor: AppColors.instance.primaryColor
        ),
        child: Text(name,style: AppStyles.instance.h5.copyWith(color: AppColors.instance.whitColor,fontSize: 15),),),

    );
  }
}


class customOutlineButton extends StatelessWidget {
  customOutlineButton({super.key,required this.name,required this.onClick});

  String name;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onClick(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5,color: AppColors.instance.black),
            borderRadius: BorderRadius.circular(7)
        ),
        child: Text(name,style: AppStyles.instance.h2.copyWith(color: AppColors.instance.primaryColor,fontSize: 14)),
      ),
    );
  }
}

