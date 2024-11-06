import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbmela/res/route/route_name.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          (rheight * .02).height,
          _profileSection(),
          (rheight * .02).height,
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          (rheight * .015).height,
          Row(
            children: [
              CustomText('Duty',
                  style: AppStyles.instance.h2
                      .copyWith(color: AppColors.instance.whitColor)),
              const Spacer(),
              CupertinoSwitch(
                activeColor: AppColors.instance.primaryColor,
                trackColor: Colors.grey,
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ],
          ),
          (rheight * .02).height,
          _boxItem(title: 'Achieve Goal to Receive Award', title1: 'Wallet Income'),
          (rheight * .02).height,
          _boxItem(title: 'Avoid P&D', title1: 'Today Earning'),
          (rheight * .02).height,
          _boxItem(title: 'Today Working Hours', title1: 'This Month Working Hours'),
          (rheight * .02).height,
          _boxItem(title: 'P&D History', title1: 'Earning Deduction History'),
          (rheight * .02).height,
          _cardItem(title: 'Company Credentials'),


          const Spacer(),
          _cardItem(title: 'You are offline'),
          11.height,
        ],
      ).paddingSymmetric(horizontal: rwidth * .05),
    ));
  }

  Widget _cardItem({required String title}){
    return Container(
      height: 70,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.5, color: Colors.grey.withOpacity(.8)),
          borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: CustomText(
          title,
          style: AppStyles.instance.h3.copyWith(
              color: AppColors.instance.whitColor,
              fontWeight: FontWeight.w500,fontSize: 17),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _boxItem({required String title,required String title1}){
    return  Row(
      children: [
        Expanded(
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.5, color: Colors.grey.withOpacity(.8)),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: CustomText(
                title,
                maxLines: 2,
                style: AppStyles.instance.h3.copyWith(
                    color: AppColors.instance.whitColor,
                    fontWeight: FontWeight.w500,fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        15.width,
        Expanded(
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.5, color: Colors.grey.withOpacity(.8)),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: CustomText(
                title1,
                maxLines: 2,
                style: AppStyles.instance.h3.copyWith(
                    color: AppColors.instance.whitColor,
                    fontWeight: FontWeight.w500,fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _profileSection() {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.5, color: Colors.grey.withOpacity(.8)),
              borderRadius: BorderRadius.circular(4)),
          child: Image.network(
              'https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg'),
        ),
        15.width,
        CustomText('AMB Name',
            style: AppStyles.instance.h3
                .copyWith(color: AppColors.instance.whitColor)),
        const Spacer(),
        GestureDetector(
          onTap: ()=>Get.toNamed(RouteName.pickupDropLocationScreen),
          child: const Icon(
            Icons.voice_over_off,
            size: 37,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
