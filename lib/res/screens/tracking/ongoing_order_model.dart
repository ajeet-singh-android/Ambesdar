class OnGoingOrderModel {
  int? status;
  String? msg;
  List<NearestCustomer>? nearestCustomer;

  OnGoingOrderModel({this.status, this.msg, this.nearestCustomer});

  OnGoingOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['nearestCustomer'] != null) {
      nearestCustomer = <NearestCustomer>[];
      json['nearestCustomer'].forEach((v) {
        nearestCustomer!.add(new NearestCustomer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.nearestCustomer != null) {
      data['nearestCustomer'] =
          this.nearestCustomer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearestCustomer {
  String? taskAutoId;
  String? taskId;
  String? serviceCenterAutoId;
  String? serviceCenterId;
  String? custName;
  String? custEmail;
  String? custContact;
  String? custCity;
  String? custArea;
  String? custAddress;
  String? custPincode;
  String? pickupDate;
  String? pickupStartTime;
  String? pickupEndTime;
  String? status;
  String? carNumber;
  String? custLatitude;
  String? custLongitude;
  String? sLatitude;
  String? sLongitude;
  String? sAddress;
  String? scity;
  String? sarea;
  String? spincode;
  String? sname;
  String? scontact;
  String? distance;
  String? serviceType;
  String? paymentStatus;
  String? description;
  String? vehicleName;

  NearestCustomer(
      {this.taskAutoId,
        this.taskId,
        this.serviceCenterAutoId,
        this.serviceCenterId,
        this.custName,
        this.custEmail,
        this.custContact,
        this.custCity,
        this.custArea,
        this.custAddress,
        this.custPincode,
        this.pickupDate,
        this.pickupStartTime,
        this.pickupEndTime,
        this.status,
        this.carNumber,
        this.custLatitude,
        this.custLongitude,
        this.sLatitude,
        this.sLongitude,
        this.sAddress,
        this.scity,
        this.sarea,
        this.spincode,
        this.sname,
        this.scontact,
        this.distance,
        this.serviceType,
        this.paymentStatus,
        this.description,
        this.vehicleName});

  NearestCustomer.fromJson(Map<String, dynamic> json) {
    taskAutoId = json['task_auto_id'];
    taskId = json['task_id'];
    serviceCenterAutoId = json['service_center_auto_id'];
    serviceCenterId = json['service_center_id'];
    custName = json['cust_name'];
    custEmail = json['cust_email'];
    custContact = json['cust_contact'];
    custCity = json['cust_city'];
    custArea = json['cust_area'];
    custAddress = json['cust_address'];
    custPincode = json['cust_pincode'];
    pickupDate = json['pickup_date'];
    pickupStartTime = json['pickup_start_time'];
    pickupEndTime = json['pickup_end_time'];
    status = json['status'];
    carNumber = json['car_number'];
    custLatitude = json['cust_latitude'];
    custLongitude = json['cust_longitude'];
    sLatitude = json['s_latitude'];
    sLongitude = json['s_longitude'];
    sAddress = json['s_address'];
    scity = json['scity'];
    sarea = json['sarea'];
    spincode = json['spincode'];
    sname = json['sname'];
    scontact = json['scontact'];
    distance = json['distance'];
    serviceType = json['service_type'];
    paymentStatus = json['payment_status'];
    description = json['description'];
    vehicleName = json['vehicle_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_auto_id'] = this.taskAutoId;
    data['task_id'] = this.taskId;
    data['service_center_auto_id'] = this.serviceCenterAutoId;
    data['service_center_id'] = this.serviceCenterId;
    data['cust_name'] = this.custName;
    data['cust_email'] = this.custEmail;
    data['cust_contact'] = this.custContact;
    data['cust_city'] = this.custCity;
    data['cust_area'] = this.custArea;
    data['cust_address'] = this.custAddress;
    data['cust_pincode'] = this.custPincode;
    data['pickup_date'] = this.pickupDate;
    data['pickup_start_time'] = this.pickupStartTime;
    data['pickup_end_time'] = this.pickupEndTime;
    data['status'] = this.status;
    data['car_number'] = this.carNumber;
    data['cust_latitude'] = this.custLatitude;
    data['cust_longitude'] = this.custLongitude;
    data['s_latitude'] = this.sLatitude;
    data['s_longitude'] = this.sLongitude;
    data['s_address'] = this.sAddress;
    data['scity'] = this.scity;
    data['sarea'] = this.sarea;
    data['spincode'] = this.spincode;
    data['sname'] = this.sname;
    data['scontact'] = this.scontact;
    data['distance'] = this.distance;
    data['service_type'] = this.serviceType;
    data['payment_status'] = this.paymentStatus;
    data['description'] = this.description;
    data['vehicle_name'] = this.vehicleName;
    return data;
  }
}
