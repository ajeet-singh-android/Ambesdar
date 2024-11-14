import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbmela/data/response/status.dart';
import 'package:sbmela/utils/sizes.dart';

import '../../../main.dart';
import '../../../utils/appcons.dart';
import '../../../utils/prefrence.dart';
import '../../colors/app_color.dart';
import '../../components/app_style.dart';
import '../../components/custom_buttton.dart';
import '../../components/custom_text.dart';
import '../../route/route_name.dart';
import '../dashboard/dashboard_controller.dart';

class PickupDropLocationScreen extends StatefulWidget {
  const PickupDropLocationScreen({super.key});

  @override
  State<PickupDropLocationScreen> createState() => _PickupDropLocationScreenState();
}

class _PickupDropLocationScreenState extends State<PickupDropLocationScreen> {

  late DashboardController _controller;

  @override
  void initState() {
    _controller = Get.put(DashboardController());
    super.initState();
    _controller.getAmbesderOrder();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Obx((){
        switch(_controller.rxStatus.value){

          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case Status.COMPLETE:
            final list = _controller.ambesderModel.value.allorderdetails??[];
            if(list.isNotEmpty){
              return Column(
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
                  _cardItem(title: '${list[0].carNumber}'),
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
                      Icon(Icons.location_on,size:21,color:  AppColors.instance.primaryColor,),
                      6.width,
                      CustomText(
                        'Pickup location',
                        maxLines: 4,
                        style: AppStyles.instance.h3.copyWith(
                            color: AppColors.instance.primaryColor,
                            fontWeight: FontWeight.w500,fontSize: 12),
                      )
                    ],
                  ), (rheight * .01).height,
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CustomText(
                        '${list[0].custAddress}',
                        maxLines: 4,
                        style: AppStyles.instance.h3.copyWith(
                            color: AppColors.instance.whitColor,
                            fontWeight: FontWeight.w500,fontSize: 15),
                      ),
                    ),
                  ),
                  (rheight * .02).height,
                  Row(
                    children: [
                      Icon(Icons.location_on,size:21,color:  AppColors.instance.primaryColor,),
                      6.width,
                      CustomText(
                        'Drop location',
                        maxLines: 4,
                        style: AppStyles.instance.h3.copyWith(
                            color: AppColors.instance.primaryColor,
                            fontWeight: FontWeight.w500,fontSize: 12),
                      )
                    ],
                  ), (rheight * .01).height,
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CustomText(
                        '${list[0].sAddress}',
                        maxLines: 4,
                        style: AppStyles.instance.h3.copyWith(
                            color: AppColors.instance.whitColor,
                            fontWeight: FontWeight.w500,fontSize: 15),
                      ),
                    ),
                  ),


                  (rheight * .005).height,
                  Divider(
                    thickness: 5,
                    color: AppColors.instance.primaryColor,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: rwidth*.8,
                    child: CustomButton(name: "Accept Task", onClick: () {
                     _controller.acceptOrder(list[0].taskAutoId??'');
                    }),
                  ),
                  (rheight * .03).height,
                ],
              ).paddingSymmetric(horizontal: rwidth*.05);
            }else{
              return Center(
                child: CustomText('Order not found',style: AppStyles.instance.h3.copyWith(color: Colors.white),),
              );
            }

          case Status.ERROR:
           return Center(
              child: CustomText('Order not found',style: AppStyles.instance.h3.copyWith(color: Colors.white),),
            );
        }
      }),
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
        GestureDetector(
        onTap: ()=>Get.toNamed(RouteName.profileScreen),
          child: Container(
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
        ),
        15.width,
        FutureBuilder(future: PreferenceManager.instance.getString(USER_NAME), builder: (context,name){
          return  CustomText(name.data??'',
              style: AppStyles.instance.h3
                  .copyWith(color: AppColors.instance.whitColor));
        }),
        const Spacer(),

      ],
    );
  }
}
