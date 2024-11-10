import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:sbmela/data/response/status.dart';
import 'package:sbmela/res/screens/tracking/tracking_controller.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_text.dart';
import '../../route/route_name.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  late TrackingController _controller;

  @override
  void initState() {
    _controller = Get.put(TrackingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        switch (_controller.rxStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case Status.COMPLETE:
            final list = _controller.ongoingOrder.value.nearestCustomer ?? [];
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  (rheight * .02).height,
                  _profileSection(),
                  (rheight * .02).height,
                  const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  (rheight * .02).height,
                  _cardItem(title: '${list[0].carNumber}'),
                  (rheight * .03).height,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            width: 1, color: AppColors.instance.primaryColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                            ),
                            15.width,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'Your Current location',
                                  style: AppStyles.instance.h4,
                                ),
                                CustomText(
                                  _controller.currentLocation.value,
                                  style: AppStyles.instance.h5,
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: rwidth * .02),
                          height: 40,
                          width: 2,
                          color: Colors.green,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                            ),
                            15.width,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    'Pickup location',
                                    style: AppStyles.instance.h4,
                                  ),
                                  CustomText(
                                    '${list[0].custAddress}',
                                    style: AppStyles.instance.h5,
                                    maxLines: 10,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: () => _controller.makePhoneCall(
                                    list[0].custContact ?? '123'),
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 25,
                                )),
                            5.width,
                            GestureDetector(
                                onTap: () {
                                  MapsLauncher.launchCoordinates(
                                      double.parse(list[0].custLatitude!),
                                      double.parse(list[0].custLongitude!));
                                },
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 25,
                                )),
                            5.width,
                            GestureDetector(
                                onTap: () => Get.toNamed(
                                    RouteName.picUploadScreen,
                                    arguments: [list[0], 'Pick Up']),
                                child: const Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.white,
                                  size: 25,
                                )),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: rwidth * .02),
                          height: 40,
                          width: 2,
                          color: Colors.green,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                            ),
                            15.width,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    'Drop location',
                                    style: AppStyles.instance.h4,
                                  ),
                                  CustomText(
                                    '${list[0].sAddress}',
                                    style: AppStyles.instance.h5,
                                    maxLines: 10,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: () => _controller
                                    .makePhoneCall(list[0].scontact ?? '123'),
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 25,
                                )),
                            5.width,
                            GestureDetector(
                                onTap: () {
                                  MapsLauncher.launchCoordinates(
                                      double.parse(list[0].sLatitude!),
                                      double.parse(list[0].sLongitude!));
                                },
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 25,
                                )),
                            5.width,
                            GestureDetector(
                                onTap: () => Get.toNamed(
                                    RouteName.picUploadScreen,
                                    arguments: [list[0], 'Drop']),
                                child: const Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.white,
                                  size: 25,
                                )),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: rwidth * .02),
                          height: 40,
                          width: 2,
                          color: Colors.green,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                            ),
                            15.width,
                            Expanded(
                                child: CustomText(
                              'Finish',
                              style: AppStyles.instance.h4,
                            )),
                            5.width,
                            const Icon(
                              Icons.flag,
                              color: Colors.white,
                              size: 25,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  /*  Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1,color: AppColors.instance.primaryColor)
              ),
              child: OrderTrackerZen(
                text_primary_color: Colors.white,
                tracker_data: [
                  TrackerData(
                    title: "Your current location",
                    date: "",
                    tracker_details: [
                      TrackerDetails(
                        title: "indira nagar bloc c lucknow",
                        datetime: "",
                      ),
                    ],
                  ),
                  TrackerData(
                    title: "Pickup location",
                    date: "Sat, 8 Apr '22",
                    tracker_details: [
                      TrackerDetails(
                        title: "indira nagar bloc c lucknow",
                        datetime: "",
                      ),
                    ],
                  ),
                  TrackerData(
                    title: "Drop location",
                    date: "",
                    tracker_details: [
                      TrackerDetails(
                        title: "indira nagar bloc c lucknow",
                        datetime: "",
                      ),
                    ],
                  ),
                  TrackerData(
                    title: "Finish",
                    date: "",
                    tracker_details: [

                    ],
                  ),
                ],
              ),
            ),*/
                  (rheight * .03).height,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            width: 1, color: AppColors.instance.primaryColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText('Ticket',
                            style: AppStyles.instance.h3
                                .copyWith(color: AppColors.instance.whitColor)),
                        (rheight * .013).height,
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.radio_button_off,
                                      color: Colors.white,
                                    ),
                                    10.width,
                                    CustomText('Wrong Address',
                                        style: AppStyles.instance.h4.copyWith(
                                            color:
                                                AppColors.instance.whitColor)),
                                  ],
                                ),
                              );
                            }),
                        (rheight * .02).height,
                        SizedBox(
                          width: rwidth * .8,
                          child: CustomButton(
                              name: "Cancel",
                              onClick: () {
                                Get.toNamed(RouteName.picUploadScreen);
                              }),
                        ),
                        (rheight * .02).height,
                      ],
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: rwidth * .05),
            );
          case Status.ERROR:
            return Center(
              child: CustomText(
                'Order not found',
                style: AppStyles.instance.h3.copyWith(color: Colors.white),
              ),
            );
        }
      }),
    ));
  }

  Widget _cardItem({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.grey.withOpacity(.8)),
          borderRadius: BorderRadius.circular(4)),
      child: CustomText(
        title,
        style: AppStyles.instance.h2.copyWith(
            color: AppColors.instance.whitColor,
            fontWeight: FontWeight.w500,
            fontSize: 19),
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
          onTap: () => Get.toNamed(RouteName.pickupDropLocationScreen),
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
