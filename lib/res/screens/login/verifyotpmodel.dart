class VerifyOTPModel {
  int? status;
  String? msg;
  List<Data>? data;
  String? loginDate;

  VerifyOTPModel({this.status, this.msg, this.data, this.loginDate});

  VerifyOTPModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    loginDate = json['login date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['login date'] = this.loginDate;
    return data;
  }
}

class Data {
  String? sId;
  String? ambassadorId;

  Data({this.sId, this.ambassadorId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ambassadorId = json['ambassador_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ambassador_id'] = this.ambassadorId;
    return data;
  }
}
