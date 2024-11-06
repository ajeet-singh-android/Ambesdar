import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sbmela/res/components/app_style.dart';
import 'package:sbmela/res/components/custom_text.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../assets/image_assets.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_textfield.dart';
import '../../route/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
              child: Image.asset(Assets.instance.imagesLogo,width: rwidth*.45,)),
          (rheight*.03).height,
           CustomText('Login Here',style: AppStyles.instance.h1),

          (rheight*.05).height,
          CustomTextField(hintText: 'Mobile Number', icon: Assets.instance.phone,keyboardType: TextInputType.number,maxLength: 10,),
          (rheight*.02).height,

          (rheight * .08).height,
          CustomButton(name: "Submit", onClick: () {
            Get.toNamed(RouteName.otpScreen);
          }),

        ],
      ).paddingSymmetric(horizontal: rwidth*.05),
    ));
  }
}
