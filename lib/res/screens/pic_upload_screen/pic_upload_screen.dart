import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_text.dart';

class PicUploadScreen extends StatefulWidget {
  const PicUploadScreen({super.key});

  @override
  State<PicUploadScreen> createState() => _PicUploadScreenState();
}

class _PicUploadScreenState extends State<PicUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          (rheight * .025).height,
          Row(
            children: [
              _cardItem(title: 'BMW UP-43 S 4085'),
              const Spacer(),
              _cardItem(title: 'Pick Up'),

            ],
          ),
          (rheight * .02).height,
          _cardItem(title: 'Click Pics Out Side & Pics Inside Pics : (0/16)'),
        ],
      ).paddingSymmetric(horizontal: rwidth*.05),
    ));
  }
  Widget _cardItem({required String title}){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.5, color: Colors.grey.withOpacity(.8)),
          borderRadius: BorderRadius.circular(4)),
      child: CustomText(
        title,
        maxLines: 4,
        style: AppStyles.instance.h2.copyWith(
            color: AppColors.instance.whitColor,
            fontWeight: FontWeight.w500,fontSize: 17),
        textAlign: TextAlign.start,
      ),
    );
  }
}
