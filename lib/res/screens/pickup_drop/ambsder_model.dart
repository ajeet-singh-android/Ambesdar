class AmbesderOrderModel {
  int? status;
  String? msg;
  List<Allorderdetails>? allorderdetails;

  AmbesderOrderModel({this.status, this.msg, this.allorderdetails});

  AmbesderOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['allorderdetails'] != null) {
      allorderdetails = <Allorderdetails>[];
      json['allorderdetails'].forEach((v) {
        allorderdetails!.add(new Allorderdetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.allorderdetails != null) {
      data['allorderdetails'] =
          this.allorderdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allorderdetails {
  String? taskId;
  String? taskAutoId;
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
  String? pickupOrderAccptanceTime;
  String? createdAt;
  String? description;
  String? vehicleName;

  Allorderdetails(
      {this.taskId,
        this.taskAutoId,
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
        this.pickupOrderAccptanceTime,
        this.createdAt,
        this.description,
        this.vehicleName});

  Allorderdetails.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    taskAutoId = json['task_auto_id'];
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
    pickupOrderAccptanceTime = json['pickup_order_accptance_time'];
    createdAt = json['created_at'];
    description = json['description'];
    vehicleName = json['vehicle_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['task_auto_id'] = this.taskAutoId;
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
    data['pickup_order_accptance_time'] = this.pickupOrderAccptanceTime;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['vehicle_name'] = this.vehicleName;
    return data;
  }
}
