import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbmela/data/response/status.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../../utils/prefrence.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_text.dart';
import '../dashboard/dashboard_controller.dart';
import '../login/login_controller.dart';
import '../splash/splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  late DashboardController _controller;


  @override
  void initState() {
    _controller = Get.put(DashboardController());
    super.initState();
    _controller.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Obx((){
        switch(_controller.rxProfileStatus.value){
          case Status.LOADING:
           return const Center(
             child: CircularProgressIndicator(color: Colors.white,),
           );
          case Status.COMPLETE:
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (rheight * .02).height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: ()=>Get.back(),
                          child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
                      CustomText('Profile',
                          style: AppStyles.instance.h1
                              .copyWith(color: AppColors.instance.primaryColor)),
                      5.width,
                    ],
                  ),
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
                      child: CustomText('${_controller.profileModel.value.profile![0].name}',
                          style: AppStyles.instance.h3
                              .copyWith(color: AppColors.instance.whitColor))),
                  Align(
                      alignment: Alignment.center,
                      child: CustomText('+91-${_controller.profileModel.value.profile![0].contact}',
                          style: AppStyles.instance.h4
                              .copyWith(color: AppColors.instance.whitColor))),
                  (rheight * .04).height,
                  _userItems(title: 'Address -', desc: '${_controller.profileModel.value.profile![0].address} ${_controller.profileModel.value.profile![0].area} ${_controller.profileModel.value.profile![0].city}'),
                  (rheight * .02).height,
                  _userItems(title: 'PinCode -', desc: '${_controller.profileModel.value.profile![0].pincode}'),
                  (rheight * .02).height,
                  _userItems(title: 'Aadhaar No  -', desc: '${_controller.profileModel.value.profile![0].adharNo}'),
                  (rheight * .02).height,
                  Divider(
                    height: 1,
                    color: Colors.grey.withOpacity(.5),
                  ),
                  (rheight * .02).height,
                  _items(
                    title: 'Achieve Goal to Receive Award', onClick: () {  },
                  ),
                  (rheight * .02).height,
                  _items(title: 'Wallet Income', onClick: () {  }),
                  (rheight * .02).height,
                  _items(title: 'Avoid P&D', onClick: () {  }),
                  (rheight * .02).height,
                  _items(title: 'Today Earning', onClick: () {  }),
                  (rheight * .02).height,
                  _items(title: 'This Month Working Hours', onClick: () {  }),
                  (rheight * .02).height,
                  _items(title: 'Earning Deduction History', onClick: () {  }),

                  (rheight * .02).height,
                  _items(title: 'Today Working Hours', onClick: () {  }),
                  (rheight * .02).height,
                  _items(title: 'P&D History', onClick: () {  }),
                  (rheight * .02).height,
                  _items(title: 'Company Credentials', onClick: () {  }),
                  (rheight * .02).height,
                  _items(title: 'LogOut', onClick: () {
                    _showCupertinoDialog(context);
                  }),
                  (rheight * .02).height,
                ],
              ).paddingSymmetric(horizontal: rwidth * .065),
            );
          case Status.ERROR:
            return Center(
              child: CustomText('Something went wrong',style: AppStyles.instance.h3.copyWith(color: Colors.white),),
            );
        }
      }),
    ));
  }

  Widget _items({required String title,required VoidCallback onClick}) {
    return GestureDetector(
      onTap: ()=>onClick(),
      child: Container(
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
  void _showCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure want to Logout?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('No'),
              onPressed: () {
                Get.back(); // Return "No"
              },
            ),
            CupertinoDialogAction(
              child: const Text('Yes'),
              onPressed: () async {
               _controller.logout();
              },
            ),
          ],
        );
      },
    );
  }
}
