import 'package:get/get.dart';
import 'package:sbmela/res/screens/pickup_drop/ambsder_model.dart';
import 'package:sbmela/utils/appcons.dart';
import 'package:sbmela/utils/prefrence.dart';

import '../../../data/repository/repository.dart';
import '../../../data/response/status.dart';
import '../../../utils/utils.dart';
import '../../route/route_name.dart';

class DashboardController extends GetxController{

  final _repository = Repository();

  RxBool switchValue = false.obs;
  final ambesderModel = AmbesderOrderModel().obs;
  final rxStatus = Status.LOADING.obs;


  Future<void> updateDeliveryBoyLocation(double latitue, double longitude) async {
    Utils.instance.showLoading();

    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);

    final Map<String,dynamic> request = {
      "ambassador_id": ambassadorID,
      "current_latitude":"$latitue",
      "current_longitude":"$longitude"
    };
    _repository.updateDeliveryBoyLocation(request,).then((model) async {

      if(switchValue.value){
        _repository.ongoingOrder(request).then((model) async {
          Utils.instance.hideLoading();
          final list = model.nearestCustomer??[];
          list.isNotEmpty?Get.toNamed(RouteName.trackScreen):null;
        }).catchError((onError){
          Utils.instance.hideLoading();
        });
      }else{
        Utils.instance.hideLoading();
      }

    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }



  Future<void> getAmbesderOrder() async {
    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);
    rxStatus.value = Status.LOADING;
    final Map<String,dynamic> request = {
      "ambassador_id": ambassadorID
    };
    _repository.getAmbesderOrder(request).then((model) async {
      Utils.instance.hideLoading();
      ambesderModel.value = model;
      rxStatus.value = Status.COMPLETE;
    }).catchError((onError){
      Utils.instance.hideLoading();
      rxStatus.value = Status.ERROR;
    });
  }


  Future<void> acceptOrder(String taskid) async {
    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);
    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      "ambassador_id": ambassadorID,
      "task_auto_id": taskid
    };
    _repository.acceptOrder(request).then((model) async {
      Utils.instance.hideLoading();
      Get.toNamed(RouteName.trackScreen);
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }

}