

class AppUrl {
  AppUrl._();

  static final AppUrl instance = AppUrl._();

  factory AppUrl() {
    return instance;
  }

  String baseUrl = 'https://super-admin.gdpd.in/api';
  String get masterApi => '$baseUrl/master_data';
  String get sendOTPApi => '$baseUrl/getSignupOTP';
  String get verifyOTPApi => '$baseUrl/verifySignupOTP';
  String get updateDeliveryboyLocationApi => '$baseUrl/update_DeliveryBoy_location_url';
  String get dashboardApi => '$baseUrl/dashboard';
  String get ambassadorOrderApi => '$baseUrl/getAmbassador_Order';
  String get acceptOrderApi => '$baseUrl/accept_new_order';
  String get ongoingOrderApi => '$baseUrl/get_ambassador_ongoing_order';
  String get addCarImageApi => '$baseUrl/add_car_images';
  String get getCustomerApi => '$baseUrl/getCustOTP';
  String get verifyCustomerApi => '$baseUrl/verifyCustOTP';
  String get updateDeliveryboyStatusApi => '$baseUrl/update_DeliveryBoyLocation';
  String get completeTaskApi => '$baseUrl/Complete-Task';
  String get getProfileApi => '$baseUrl/DeliveryBoy_profile';
}
