class DoctorResponseEntity {
  int? code;
  String? msg;
  List<DoctorData>? data;

  DoctorResponseEntity({this.code, this.msg, this.data});

  DoctorResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DoctorData>[];
      json['data'].forEach((v) {
        data!.add(DoctorData.fromJson(v));
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

class DoctorDetailResponseEntity {
  int? code;
  String? msg;
  DoctorData? data;

  DoctorDetailResponseEntity({this.code, this.msg, this.data});

  DoctorDetailResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? DoctorData.fromJson(json['data']) : null;
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


class DoctorData {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? token;
  String? name;
  String? email;
  String? avatar;
  String? description;
  int? order;
  String? about;
  int? score;
  int? review;
  int? patient;
  int? experience;
  int? departmentId;
  String? departmentName;
  String? workAt;
  String? position;

  DoctorData(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.token,
        this.name,
        this.email,
        this.avatar,
        this.description,
        this.order,
        this.about,
        this.score,
        this.review,
        this.patient,
        this.experience,
        this.departmentId,
        this.departmentName,
        this.workAt,
        this.position});

  DoctorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    description = json['description'];
    order = json['order'];
    about = json['about'];
    score = json['score'];
    review = json['review'];
    patient = json['patient'];
    experience = json['experience'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    workAt = json['work_at'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['description'] = description;
    data['order'] = order;
    data['about'] = about;
    data['score'] = score;
    data['review'] = review;
    data['patient'] = patient;
    data['experience'] = experience;
    data['department_id'] = departmentId;
    data['department_name'] = departmentName;
    data['work_at'] = workAt;
    data['position'] = position;
    return data;
  }
}