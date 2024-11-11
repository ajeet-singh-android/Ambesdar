import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../assets/image_assets.dart';
import '../../components/custom_buttton.dart';
import '../../route/route_name.dart';
import '../login/login_controller.dart';

class SelfiScreen extends StatefulWidget {
  const SelfiScreen({super.key});

  @override
  State<SelfiScreen> createState() => _SelfiScreenState();
}

class _SelfiScreenState extends State<SelfiScreen> {
  late LoginController _controller;

  @override
  void initState() {
    _controller = Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          (rheight * .06).height,
          Container(
            height: rheight*.42,
              width: rwidth*.8,
              margin: EdgeInsets.symmetric(horizontal: rwidth * .05),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: Colors.grey.withOpacity(.8)),
                  borderRadius: BorderRadius.circular(4)),
              child: Obx(
                () => _controller.selectedSelfi.isNotEmpty
                    ? GestureDetector(
                    onTap: () async {
                      final XFile? photo =
                          await picker.pickImage(source: ImageSource.camera);
                      if (photo != null) {
                        _controller.selectedSelfi.value = photo!.path ?? '';
                        _controller.testCompressAndGetFile(File(photo!.path ?? ''));
                      }
                    },
                    child: Image.file(File(_controller.selectedSelfi.value),fit: BoxFit.cover,))
                    : Image.asset(Assets.instance.user),
              )),
          (rheight * .09).height,
          SizedBox(
            width: rwidth * .5,
            child: Obx(() => CustomButton(
                name:
                    _controller.selectedSelfi.isNotEmpty ? 'Signin' : "Capture",
                onClick: () async {
                  if (_controller.selectedSelfi.isNotEmpty) {
                    _controller.verifySignupOTP();
                  } else {
                    final XFile? photo =
                        await picker.pickImage(source: ImageSource.camera);
                    if (photo != null) {
                      _controller.selectedSelfi.value = photo!.path ?? '';
                      _controller.testCompressAndGetFile(File(photo!.path ?? ''));
                    }
                  }
                })),
          ),
        ],
      ).paddingSymmetric(horizontal: rwidth * .05),
    ));
  }
}
