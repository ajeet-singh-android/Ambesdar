import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbmela/main.dart';


import '../../assets/image_assets.dart';
import '../../route/route_name.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
            () =>  Get.toNamed(RouteName.login_screen)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(Assets.instance.imagesLogo,width: rwidth*.6,),
      ),
    );
  }
}
