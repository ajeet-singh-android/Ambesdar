import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:sbmela/res/colors/app_color.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../components/app_style.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_text.dart';
import '../../route/route_name.dart';
import '../login/login_controller.dart';

class GravitydriveScreen extends StatefulWidget {
  const GravitydriveScreen({super.key});

  @override
  State<GravitydriveScreen> createState() => _GravitydriveScreenState();
}

class _GravitydriveScreenState extends State<GravitydriveScreen> {

  late LoginController _controller;

  @override
  void initState() {
    _controller = Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (rheight*.02).height,
          CustomText('Gravity Drive',style: AppStyles.instance.h1.copyWith(color: AppColors.instance.primaryColor)),
          (rheight*.05).height,

          _items('Shower'),
          (rheight*.02).height,
          _items('ID Card'),
          (rheight*.02).height,
          _items('Power Bank / Charger'),
          (rheight*.02).height,
          _items('Dress Code'),
          (rheight*.07).height,
          SizedBox(
            width: rwidth*.5,
            child: CustomButton(name: "Take Selfi", onClick: () {
              Get.toNamed(RouteName.selfiScreen);
            }),
          ),

          const Spacer(),

          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.grey.withOpacity(.4),
            child: Row(
              children: [
                const Icon(Icons.location_on,color: Colors.white,size: 31,),
                15.width,
               Obx(()=> CustomText(
                  _controller.currentLocation.value,
                  style: AppStyles.instance.h4.copyWith(color: Colors.white),
                  maxLines: 10,
                )),
              ],
            ),
          ),

            (rheight*.05).height,

        ],
      ).paddingSymmetric(horizontal: rwidth*.05),
    ));
  }
  
  Widget _items(String title){
    return    Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 11),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(width: .7,color: Colors.grey.withOpacity(.9))
            ),
            child:  Center(child: CustomText(title,style: AppStyles.instance.h3)),
          ),
        ),
        15.width,
        MSHCheckbox(
          size: 40,
          value: false,
          colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
            checkedColor: AppColors.instance.primaryColor,
          ),
          style: MSHCheckboxStyle.fillScaleColor,
          onChanged: (selected) {},
        ),
      ],
    );
  }
}
