
class AppointmentRequestEntity {
  String? token;
  String? chooseDay;
  String? chooseTime;

  AppointmentRequestEntity({
    this.token,
    this.chooseDay,
    this.chooseTime,
  });

  Map<String, dynamic> toJson() => {
    "token": token,
    "choose_day": chooseDay,
    "choose_time": chooseTime,
  };
}

class AppointmentTimeResponseEntity {
  int? code;
  String? msg;
  AppointmentTimeData? data;

  AppointmentTimeResponseEntity({this.code, this.msg, this.data});

  AppointmentTimeResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? AppointmentTimeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AppointmentTimeData {
  List<String>? afternoon;
  List<String>? evening;
  List<String>? morning;

  AppointmentTimeData({this.afternoon, this.evening, this.morning});

  AppointmentTimeData.fromJson(Map<String, dynamic> json) {
    afternoon = json['afternoon'].cast<String>();
    evening = json['evening'].cast<String>();
    morning = json['morning'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['afternoon'] = afternoon;
    data['evening'] = evening;
    data['morning'] = morning;
    return data;
  }
}

class NextDayItem {
  String? weekday;
  int? day;
  String? daytime;

  NextDayItem({this.weekday, this.day, this.daytime});

  NextDayItem.fromJson(Map<String, dynamic> json) {
    weekday = json['weekday'];
    day = json['day'];
    daytime = json['daytime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weekday'] = weekday;
    data['day'] = day;
    data['daytime'] = daytime;
    return data;
  }
}

class ApppointResponseEntity {
  int? code;
  String? msg;
  List<ApppointData>? data;

  ApppointResponseEntity({this.code, this.msg, this.data});

  ApppointResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ApppointData>[];
      json['data'].forEach((v) {
        data!.add(ApppointData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApppointData {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? userToken;
  String? doctorToken;
  String? chooseTime;
  String? chooseDay;
  String? doctorName;
  String? appointmentType;
  String? place;
  int? status;

  ApppointData(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.userToken,
        this.doctorToken,
        this.chooseTime,
        this.chooseDay,
        this.doctorName,
        this.appointmentType,
        this.place,
        this.status});

  ApppointData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userToken = json['user_token'];
    doctorToken = json['doctor_token'];
    chooseTime = json['choose_time'];
    chooseDay = json['choose_day'];
    doctorName = json['doctor_name'];
    appointmentType = json['appointment_type'];
    place = json['place'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_token'] = userToken;
    data['doctor_token'] = doctorToken;
    data['choose_time'] = chooseTime;
    data['choose_day'] = chooseDay;
    data['doctor_name'] = doctorName;
    data['appointment_type'] = appointmentType;
    data['place'] = place;
    data['status'] = status;
    return data;
  }
}