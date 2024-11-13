
import 'package:sbmela/res/screens/dashboard/profile_model.dart';
import 'package:sbmela/res/screens/pickup_drop/ambsder_model.dart';
import 'package:sbmela/res/screens/tracking/ongoing_order_model.dart';

import '../../res/screens/login/otpmodel.dart';
import '../../res/screens/login/verifyotpmodel.dart';
import '../../utils/appcons.dart';
import '../../utils/prefrence.dart';
import '../app_urls/app_url.dart';
import '../network/network_api_services.dart';

class Repository{

  final _apiService = NetworkApiServices();

  Future<OTPModel> sendOTP(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.sendOTPApi);
    print(resposne);
    return OTPModel.fromJson(resposne);
  }

  Future<VerifyOTPModel> verifyOTP(var data,String image) async {
    dynamic resposne = await _apiService.postMultipartApi(data,image, AppUrl.instance.verifyOTPApi);
    print(resposne);
    return VerifyOTPModel.fromJson(resposne);
  }

  Future<OTPModel> updateDeliveryBoyLocation(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.updateDeliveryboyLocationApi);
    print(resposne);
    return OTPModel.fromJson(resposne);
  }

  Future<AmbesderOrderModel> getAmbesderOrder(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.ambassadorOrderApi);
    print(resposne);
    return AmbesderOrderModel.fromJson(resposne);
  }

  Future<dynamic> acceptOrder(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.acceptOrderApi);
    print(resposne);
    return resposne;
  }

  Future<dynamic> addCarImage(var data,List<String> outerimg, List<String> innerimg,) async {
    dynamic resposne = await _apiService.postMultipartApi1(data, outerimg,innerimg,AppUrl.instance.addCarImageApi);
    print(resposne);
    return resposne;
  }

  Future<OnGoingOrderModel> ongoingOrder(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.ongoingOrderApi);
    print(resposne);
    return OnGoingOrderModel.fromJson(resposne);
  }

  Future<OTPModel> getCustomerOTP(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.getCustomerApi);
    print(resposne);
    return OTPModel.fromJson(resposne);
  }

  Future<OTPModel> verifyCustomerOTP(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.verifyCustomerApi);
    print(resposne);
    return OTPModel.fromJson(resposne);
  }

  Future<dynamic> updateDeliveryBoyStatus(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.updateDeliveryboyStatusApi);
    print(resposne);
    return resposne;
  }

  Future<dynamic> completeTask(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.completeTaskApi);
    print(resposne);
    return resposne;
  }

  Future<ProfileModel> getProfile(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.getProfileApi);
    print(resposne);
    return ProfileModel.fromJson(resposne);
  }

  Future<dynamic> updateTaskStatus(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.updateTaskStatusApi);
    print(resposne);
    return resposne;
  }

  Future<dynamic> logOutApi(var data) async {
    dynamic resposne = await _apiService.postApi(data, AppUrl.instance.logOutApi);
    print(resposne);
    return resposne;
  }

}