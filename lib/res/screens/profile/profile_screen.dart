import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (rheight * .02).height,
            Align(
                alignment: Alignment.center,
                child: CustomText('Profile',
                    style: AppStyles.instance.h1
                        .copyWith(color: AppColors.instance.primaryColor))),
            (rheight * .04).height,
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 120,
                width: 120,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.5, color: Colors.grey.withOpacity(.8)),
                    borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      'https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg'),
                ),
              ),
            ),
            (rheight * .02).height,
            Align(
                alignment: Alignment.center,
                child: CustomText('Ajeet Singh',
                    style: AppStyles.instance.h3
                        .copyWith(color: AppColors.instance.whitColor))),
            Align(
                alignment: Alignment.center,
                child: CustomText('+919889439924',
                    style: AppStyles.instance.h4
                        .copyWith(color: AppColors.instance.whitColor))),
            (rheight * .04).height,
            _userItems(title: 'Address -', desc: 'Khirai Khirwa'),
            (rheight * .02).height,
            _userItems(title: 'PinCode -', desc: '123233'),
            (rheight * .02).height,
            _userItems(title: 'Aadhaar No  -', desc: '123233'),
            (rheight * .02).height,
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(.5),
            ),
            (rheight * .02).height,
            _items(
              title: 'Achieve Goal to Receive Award',
            ),
            (rheight * .02).height,
            _items(title: 'Wallet Income'),
            (rheight * .02).height,
            _items(title: 'Avoid P&D'),
            (rheight * .02).height,
            _items(title: 'Today Earning'),
            (rheight * .02).height,
            _items(title: 'This Month Working Hours'),
            (rheight * .02).height,
            _items(title: 'Earning Deduction History'),

            (rheight * .02).height,
            _items(title: 'Today Working Hours'),
            (rheight * .02).height,
            _items(title: 'P&D History'),
            (rheight * .02).height,
            _items(title: 'Company Credentials'),
            (rheight * .02).height,
          ],
        ).paddingSymmetric(horizontal: rwidth * .065),
      ),
    ));
  }

  Widget _items({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          CustomText(title,
              style: AppStyles.instance.h3
                  .copyWith(color: AppColors.instance.whitColor, fontSize: 16)),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 17,
          )
        ],
      ),
    );
  }

  Widget _userItems({required String title, required String desc}) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: CustomText(title,
                style: AppStyles.instance.h4.copyWith(
                    color: AppColors.instance.secondryColor, fontSize: 16))),
        Expanded(
            flex: 3,
            child: CustomText(
              desc,
              style: AppStyles.instance.h5
                  .copyWith(color: AppColors.instance.whitColor),
              maxLines: 5,
            )),
      ],
    );
  }
}
