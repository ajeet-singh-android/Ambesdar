
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'package:sbmela/utils/sizes.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_text.dart';
import '../../route/route_name.dart';
import '../login/login_controller.dart';



class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late LoginController _controller;

  @override
  void initState() {
    _controller = Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.mheight(.08),
              CustomText(
                'Enter OTP',
                style: AppStyles.instance.h1
                    .copyWith(color: AppColors.instance.primaryColor),
              ),
              context.mheight(.02),
              CustomText(
                'OTP has been sent to your phone number\n +91-${_controller.mobileController.text}',
                style: AppStyles.instance.h4.copyWith(fontWeight: FontWeight.w400),maxLines: 2,
              ),
              (rheight * .04).height,
              SizedBox(
                width: rwidth*.6,
                child: OTPTextField(
                  width: rwidth,
                  length: 4,
                  fieldWidth: 51,
                  style: AppStyles.instance.h3.copyWith(color: Colors.white),
                  fieldStyle: FieldStyle.box,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: Colors.white,
                    focusBorderColor: Colors.yellow,
                    enabledBorderColor: Colors.white
                  ),
                  onChanged: (pin) {
                    _controller.otp = pin;
                  },
                ),
              ),
              (rheight * .035).height,
             Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    10.width,
                    MSHCheckbox(
                      size: 20,
                      value: true,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: AppColors.instance.primaryColor,
                      ),
                      style: MSHCheckboxStyle.fillScaleColor,
                      onChanged: (selected) {},
                    ),
                    10.width,
                    Flexible(
                      child: RichText(
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        text: TextSpan(
                          text: 'I agree to be bound by these\n',
                          style: AppStyles.instance.h4.copyWith(color: Colors.grey.withOpacity(0.7)),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Policies',
                              style: AppStyles.instance.h4
                                  .copyWith(color: AppColors.instance.primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {

                                },
                            ),
                            TextSpan(
                              text: ' and ',
                              style: AppStyles.instance.h4,
                            ),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: AppStyles.instance.h4
                                  .copyWith(color: AppColors.instance.primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {

                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (rheight * .08).height,
              CustomButton(name: "Submit", onClick: () {
                _controller.validateOTP();
              }),
            ],
          ).paddingSymmetric(horizontal: rwidth * .06),
        ));
  }
}
