import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../components/custom_buttton.dart';
import '../../route/route_name.dart';

class SelfiScreen extends StatefulWidget {
  const SelfiScreen({super.key});

  @override
  State<SelfiScreen> createState() => _SelfiScreenState();
}

class _SelfiScreenState extends State<SelfiScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [

          (rheight*.06).height,

          Container(
            margin: EdgeInsets.symmetric(horizontal: rwidth*.05),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(width: 2,color: Colors.grey.withOpacity(.8)),
              borderRadius: BorderRadius.circular(4)
            ),
            child: Image.network('https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg'),
          ),
          (rheight*.09).height,
          SizedBox(
            width: rwidth*.5,
            child: CustomButton(name: "Capture", onClick: () {
              Get.toNamed(RouteName.dashboard_screen);
            }),
          ),

        ],
      ).paddingSymmetric(horizontal: rwidth*.05),
    ));
  }
}
