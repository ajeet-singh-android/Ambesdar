import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sbmela/data/repository/repository.dart';
import 'package:sbmela/res/route/route_name.dart';
import 'package:sbmela/res/screens/dashboard/profile_model.dart';
import 'package:sbmela/utils/utils.dart';

import '../../../utils/appcons.dart';
import '../../../utils/prefrence.dart';

class LoginController extends GetxController{

  final _repository = Repository();
  TextEditingController mobileController = TextEditingController();

  RxString selectedSelfi = ''.obs;
  String otp = '';

  @override
  void onInit() {
    _getCurrentLocation();
    super.onInit();
  }

  String generateRandomFileName() {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();

    return randomString;
  }

  void testCompressAndGetFile(File file) async {
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

    // Print sizes of the original and compressed images
    print('Original size: ${file.lengthSync()}');
    print('Compressed size--------------: ${result!.path}');
    selectedSelfi.value = result!.path;
  }

  void verifySignupOTP(){
    Utils.instance.showLoading();
    String mobile = mobileController.text.toString().trim();
    final Map<String,dynamic> request = {
      "contact":mobile,
      'otp':otp
    };
    _repository.verifyOTP(request,selectedSelfi.value).then((model) async {
      Utils.instance.hideLoading();
      if(model.status==1){
        await PreferenceManager.instance.saveString(TOKEN, model.data![0].sId!);
        await PreferenceManager.instance.saveString(AMBESDERID, model.data![0].ambassadorId!);
        getProfile(model.data![0].sId!);
      }else{
        Utils.instance.showSnackbar('${model.msg}');
      }

    }).catchError((onError){
      print(onError);
      Utils.instance.hideLoading();
    });
  }


  final profileModel = ProfileModel().obs;

  void getProfile(String autoid){
    Utils.instance.showLoading();
    final Map<String,dynamic> request = {
      "ambassador_auto_id":autoid
    };
    _repository.getProfile(request).then((model) async {
      Utils.instance.hideLoading();
      profileModel.value = model;
      await PreferenceManager.instance.saveString(USER_NAME, model.profile![0].name!);
      await PreferenceManager.instance.saveString(IMAGE, model.profile![0].profileImg!);
      await PreferenceManager.instance.saveString(MOBILE, model.profile![0].contact!);
      Get.toNamed(RouteName.dashboard_screen);
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }

  void validateOTP(){
   if(otp.isEmpty){
     Utils.instance.showSnackbar('Please Enter OTP');
     return;
   }

   if(otp.length!=4){
     Utils.instance.showSnackbar('Please Enter valid OTP');
     return;
   }
   Get.toNamed(RouteName.gravityDriveScreen);
  }


  void sendOTP(){
    String mobile = mobileController.text.toString().trim();
    if(mobile.isEmpty){
      Utils.instance.showSnackbar('Please Enter Mobile Number');
      return;
    }
    if(mobile.length!=10){
      Utils.instance.showSnackbar('Please Enter 10 digit Mobile Number');
      return;
    }

    Utils.instance.showLoading();

    final Map<String,dynamic> request = {
      "contact":mobile,
    };

    _repository.sendOTP(request).then((model){
      Utils.instance.hideLoading();
      if(model.status==1){
        Get.toNamed(RouteName.otpScreen);
      }else{
        Utils.instance.showSnackbar('${model.msg}');
      }
    }).catchError((onError){
      Utils.instance.hideLoading();
    });
  }


  double latitude=0.0;
  double longitude=0.0;
  String _locationMessage = "";
  RxString currentLocation = "".obs;
  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle the case when location services are not enabled
      _locationMessage = "Location services are disabled.";
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Handle the case when permissions are not granted
        _locationMessage = "Location permissions are denied";
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude = position.latitude;
    longitude = position.longitude;
    _locationMessage =
    "Latitude: ${position.latitude}, Longitude: ${position.longitude}";

    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      currentLocation.value = "${place.street}, ${place.locality},  ${place.postalCode}, ${place.country}";
    }
  }

}