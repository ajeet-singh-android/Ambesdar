import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sbmela/res/screens/tracking/ongoing_order_model.dart';

import '../../../data/repository/repository.dart';
import '../../../utils/appcons.dart';
import '../../../utils/prefrence.dart';
import '../../../utils/utils.dart';

class PicuploadController extends GetxController{

  RxList<String> imagelist = List.filled(16, '').obs;
  final _repository = Repository();
  String otp = '';



  String generateRandomFileName() {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
    return randomString;
  }

  Future<String> compressImage(File file) async {
    // Get the directory to save the compressed file
    final directory = await getTemporaryDirectory();
    // Define the target path for the compressed image
    String targetPath = '${directory.path}/compressed_image_${generateRandomFileName()}.jpg';

    // Compress the image
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, // Original image file path
      targetPath,         // Target path for compressed image
      quality: 40,        // Compression quality (1-100)// Rotation angle if needed
    );
   return result!.path;
  }

  List<List<String>> divideList() {
    int halfLength = imagelist.length ~/ 2;  // Divide the length by 2
    List<String> firstHalf = imagelist.sublist(0, halfLength); // First half
    List<String> secondHalf = imagelist.sublist(halfLength); // Second half

    return [firstHalf, secondHalf];
  }

  bool isListValid() {
    return imagelist.every((item) => item.trim().isNotEmpty && item.isNotEmpty);
  }

  Future<void> uploadCarimage(String taskid,int type) async {

    if(!isListValid()){
      Utils.instance.showSnackbar('please selected required image');
      return;
    }
    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);
    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      "task_id":taskid,
      'ambassador_id':ambassadorID
    };

    final sepratelist = divideList();

    _repository.addCarImage(request,sepratelist[1],sepratelist[0]).then((model) async {
      Utils.instance.hideLoading();
      Utils.instance.showSnackbar('uploaded image');

      if(type==1){
        startRide_updateStatus();
      }else{
        completeTask();
      }

    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }


  Future<void> startRide_updateStatus() async {
    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);
    // Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      "status":'Ongoing_to_Service_Center',
      "ambassador_id":ambassadorID
    };
    _repository.updateDeliveryBoyStatus(request).then((model){
      Get.back();
      Utils.instance.hideLoading();
      Get.back();
      Navigator.pop(Get.context!);
    }).catchError((error){
      Utils.instance.hideLoading();
    });
  }

  Future<void> completeTask() async {
    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);
    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      "status":'Ongoing_to_Service_Center',
      "ambassador_id":ambassadorID,
      "task_auto_id":'',
      "extra_km":'',
      "payment_status":'',
      "service_center_auto_id":'',
      "waiting_time":''
    };
    _repository.updateDeliveryBoyStatus(request).then((model){
      Utils.instance.hideLoading();
      Get.back();
    }).catchError((error){
      Utils.instance.hideLoading();
    });
  }



  Future<void> getCustomerOTP(NearestCustomer customer) async {
    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);
    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      "contact":customer.custContact,
      "task_id":customer.taskId,
      "ambassador_id":ambassadorID
    };
    _repository.getCustomerOTP(request).then((model){
      Utils.instance.hideLoading();
    }).catchError((error){
      Utils.instance.hideLoading();
    });
  }

  Future<void> verifyCustomerOTP(NearestCustomer customer, int type) async {

    if(!isListValid()){
      Utils.instance.showSnackbar('please selected required image');
      return;
    }

    if(otp.isEmpty){
      Utils.instance.showSnackbar('Please Enter OTP');
      return;
    }

    if(otp.length!=4){
      Utils.instance.showSnackbar('Please Enter valid OTP');
      return;
    }

    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);
    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      "contact":customer.custContact,
      "task_id":customer.taskId,
      "ambassador_id":ambassadorID,
      "otp":"1234"
    };
    _repository.verifyCustomerOTP(request).then((model){
      Utils.instance.hideLoading();
      uploadCarimage(customer.taskId??'',type);
    }).catchError((error){
      Utils.instance.hideLoading();
    });
  }

}