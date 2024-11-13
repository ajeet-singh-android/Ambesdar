import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbmela/res/route/route_name.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../components/app_style.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_text.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: rwidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (rheight * .1).height,
            Container(
              height: rheight*.25,
              width: rheight*.25,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(.2)
            ),
            child: const Icon(CupertinoIcons.check_mark_circled,color: Colors.green,size: 111,),
            ),
            (rheight * .04).height,
            CustomText(
              'Congratulations!',
              style: AppStyles.instance.h2,
            ),
            (rheight * .02).height,
            CustomText(
              'You have earned 125 Rs Points!',
              style: AppStyles.instance.h3.copyWith(fontWeight: FontWeight.w500),
            ),
            (rheight * .02).height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomText(
                "You've achieved a milestone! Your hard work and dedication have paid off, and you've earned a whopping 145 points! This is a testament to your commitment",maxLines: 11,
                style: AppStyles.instance.h5.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,
              ),
            ),
            (rheight * .12).height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(name: "Continue", onClick: () {
                Get.offAllNamed(RouteName.dashboard_screen);
              }),
            ),
          ],
        ),
      ),
    ));
  }
}
