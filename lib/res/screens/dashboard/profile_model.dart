class ProfileModel {
  int? status;
  String? msg;
  List<Profile>? profile;

  ProfileModel({this.status, this.msg, this.profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['profile'] != null) {
      profile = <Profile>[];
      json['profile'].forEach((v) {
        profile!.add(new Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.profile != null) {
      data['profile'] = this.profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  String? sId;
  String? ambassadorId;
  String? name;
  String? contact;
  String? profileImg;
  String? city;
  String? area;
  String? address;
  String? slatitude;
  String? slongitude;
  String? pincode;
  String? adharNo;
  String? adharImg;
  String? drivingLicNo;
  String? drivingImg;
  String? status;
  String? verificationStatus;
  String? updatedAt;
  String? createdAt;
  String? otp;
  Null? token;

  Profile(
      {this.sId,
        this.ambassadorId,
        this.name,
        this.contact,
        this.profileImg,
        this.city,
        this.area,
        this.address,
        this.slatitude,
        this.slongitude,
        this.pincode,
        this.adharNo,
        this.adharImg,
        this.drivingLicNo,
        this.drivingImg,
        this.status,
        this.verificationStatus,
        this.updatedAt,
        this.createdAt,
        this.otp,
        this.token});

  Profile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ambassadorId = json['ambassador_id'];
    name = json['name'];
    contact = json['contact'];
    profileImg = json['profile_img'];
    city = json['city'];
    area = json['area'];
    address = json['address'];
    slatitude = json['slatitude'];
    slongitude = json['slongitude'];
    pincode = json['pincode'];
    adharNo = json['adhar_no'];
    adharImg = json['adhar_img'];
    drivingLicNo = json['driving_lic_no'];
    drivingImg = json['driving_img'];
    status = json['status'];
    verificationStatus = json['verification_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    otp = json['otp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ambassador_id'] = this.ambassadorId;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['profile_img'] = this.profileImg;
    data['city'] = this.city;
    data['area'] = this.area;
    data['address'] = this.address;
    data['slatitude'] = this.slatitude;
    data['slongitude'] = this.slongitude;
    data['pincode'] = this.pincode;
    data['adhar_no'] = this.adharNo;
    data['adhar_img'] = this.adharImg;
    data['driving_lic_no'] = this.drivingLicNo;
    data['driving_img'] = this.drivingImg;
    data['status'] = this.status;
    data['verification_status'] = this.verificationStatus;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['otp'] = this.otp;
    data['token'] = this.token;
    return data;
  }
}
