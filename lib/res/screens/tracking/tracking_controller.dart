import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sbmela/res/screens/tracking/ongoing_order_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/repository/repository.dart';
import '../../../data/response/status.dart';
import '../../../utils/appcons.dart';
import '../../../utils/prefrence.dart';
import '../../../utils/utils.dart';

class TrackingController extends GetxController{

  final _repository = Repository();
  final rxStatus = Status.LOADING.obs;
  final ongoingOrder = OnGoingOrderModel().obs;

  @override
  void onInit() {
    _getCurrentLocation();
    getOngoingOrder();
    super.onInit();
  }

  Future<void> getOngoingOrder() async {
    final ambassadorID = await PreferenceManager.instance.getString(AMBESDERID);
    rxStatus.value = Status.LOADING;
    final Map<String,dynamic> request = {
      "ambassador_id": ambassadorID
    };
    _repository.ongoingOrder(request).then((model) async {
      Utils.instance.hideLoading();
      ongoingOrder.value = model;
      rxStatus.value = Status.COMPLETE;
    }).catchError((onError){
      Utils.instance.hideLoading();
      rxStatus.value = Status.ERROR;
    });
  }

  void makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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