import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_text.dart';
import '../../route/route_name.dart';

class PickupDropLocationScreen extends StatefulWidget {
  const PickupDropLocationScreen({super.key});

  @override
  State<PickupDropLocationScreen> createState() => _PickupDropLocationScreenState();
}

class _PickupDropLocationScreenState extends State<PickupDropLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
          (rheight * .02).height,
          _cardItem(title: 'Alert : Pickup & Drop'),
          (rheight * .02).height,
          _cardItem(title: 'BMW UP-43 S 4085'),
          (rheight * .02).height,
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1,color: Colors.grey)
            ),
            child: Center(
              child: CustomText(
                '145',
                style: AppStyles.instance.h2.copyWith(
                    color: AppColors.instance.primaryColor,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          (rheight * .05).height,

          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.location_on,size:28,color:  AppColors.instance.primaryColor,),
                    6.width,
                    Flexible(
                      child: CustomText(
                        'Bavdhan, pune Maharastra',
                        maxLines: 4,
                        style: AppStyles.instance.h3.copyWith(
                            color: AppColors.instance.whitColor,
                            fontWeight: FontWeight.w500,fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: CustomText(
                        'Bavdhan, pune Maharastra',
                        maxLines: 4,
                        style: AppStyles.instance.h3.copyWith(
                            color: AppColors.instance.whitColor,
                            fontWeight: FontWeight.w500,fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    6.width,
                    Icon(Icons.location_on,size:28,color:  AppColors.instance.primaryColor,),

                  ],
                ),
              ),
            ],
          ),
          (rheight * .005).height,
           Divider(
            thickness: 5,
            color: AppColors.instance.primaryColor,
          ),
          const Spacer(),
          SizedBox(
            width: rwidth*.8,
            child: CustomButton(name: "Accept Pickup", onClick: () {
              Get.toNamed(RouteName.picUploadScreen);
            }),
          ),
          (rheight * .03).height,
        ],
      ).paddingSymmetric(horizontal: rwidth*.05),
    ));
  }

  Widget _cardItem({required String title}){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.5, color: Colors.grey.withOpacity(.8)),
          borderRadius: BorderRadius.circular(4)),
      child: CustomText(
        title,
        style: AppStyles.instance.h2.copyWith(
            color: AppColors.instance.whitColor,
            fontWeight: FontWeight.w500,fontSize: 19),
        textAlign: TextAlign.center,
      ),
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
