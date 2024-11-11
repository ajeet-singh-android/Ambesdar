import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:sbmela/res/screens/pic_upload_screen/picupload_controller.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_text.dart';
import '../../route/route_name.dart';
import '../tracking/ongoing_order_model.dart';

class PicUploadScreen extends StatefulWidget {
  const PicUploadScreen({super.key});

  @override
  State<PicUploadScreen> createState() => _PicUploadScreenState();
}

class _PicUploadScreenState extends State<PicUploadScreen> {
  late PicuploadController _controller;

  String type = '';

  late NearestCustomer _customer;

  @override
  void initState() {
    _customer = Get.arguments[0];
    type = Get.arguments[1];
    _controller = Get.put(PicuploadController());
    super.initState();
    _controller.getCustomerOTP(_customer);

  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (rheight * .025).height,
            Row(
              children: [
                _cardItem(title: _customer.carNumber??''),
                const Spacer(),
                _cardItem(title: type),
              ],
            ),
            (rheight * .02).height,
           Obx(()=> _cardItem(title: 'Click Pics Out Side & Pics Inside Pics : (${_controller.imagelist.where((image) => image.isNotEmpty).length}/${_controller.imagelist.length})')),
            (rheight * .02).height,
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => _controller.imagelist.add(''),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      'Add image Box',
                      maxLines: 4,
                      style: AppStyles.instance.h2.copyWith(
                          color: AppColors.instance.whitColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                    6.width,
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.instance.primaryColor),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        size: 24,
                        color: Colors.black,
                      )),
                    )
                  ],
                ),
              ),
            ),
            (rheight * .02).height,
            Obx(() => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _controller.imagelist.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 1.2 / 1.2),
                itemBuilder: (context, index) {
                  final data = _controller.imagelist[index];
                  return GestureDetector(
                    onTap: () async {
                      final XFile? photo =
                          await picker.pickImage(source: ImageSource.camera);
                      if (photo != null) {
                        _controller
                            .compressImage(File(photo?.path ?? ''))
                            .then((path) {
                          _controller.imagelist[index] = path;
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: data.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.file(
                                File(data),
                                fit: BoxFit.cover,
                              ),
                            )
                          : CustomText(
                              '${index + 1}',
                              maxLines: 4,
                              style: AppStyles.instance.h2.copyWith(
                                  color: AppColors.instance.whitColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                              textAlign: TextAlign.start,
                            ),
                    ),
                  );
                })),
            (rheight * .02).height,
            CustomText(
              'Enter OTP',
              maxLines: 4,
              style: AppStyles.instance.h2.copyWith(
                  color: AppColors.instance.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 19),
              textAlign: TextAlign.start,
            ),
            (rheight * .015).height,
            Row(
              children: [
                SizedBox(
                  width: rwidth * .6,
                  child: OTPTextField(
                    width: rwidth,
                    length: 4,
                    fieldWidth: 51,
                    style: AppStyles.instance.h3.copyWith(color: Colors.white),
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                        borderColor: Colors.white,
                        focusBorderColor: Colors.yellow,
                        enabledBorderColor: Colors.white),
                    onChanged: (pin) {
                      _controller.otp = pin;
                    },
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    _controller.getCustomerOTP(_customer);
                  },
                  child: CustomText(
                    'Resend OTP',
                    maxLines: 4,
                    style: AppStyles.instance.h2.copyWith(
                        color: AppColors.instance.gary,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.yellow),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            (rheight * .015).height,
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: rwidth * .8,
                child: CustomButton(
                    name: type=='Pick Up'?"Start Ride":'Complete Task',
                    onClick: () {
                      name: type=='Pick Up'?_controller.verifyCustomerOTP(_customer,1):_controller.verifyCustomerOTP(_customer,2);
                    }),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: rwidth * .05),
      ),
    ));
  }

  Widget _cardItem({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.grey.withOpacity(.8)),
          borderRadius: BorderRadius.circular(4)),
      child: CustomText(
        title,
        maxLines: 4,
        style: AppStyles.instance.h2.copyWith(
            color: AppColors.instance.whitColor,
            fontWeight: FontWeight.w500,
            fontSize: 17),
        textAlign: TextAlign.start,
      ),
    );
  }
}
