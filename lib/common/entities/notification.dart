class NotificationResponseEntity {
  int? code;
  String? msg;
  List<NotificationData>? data;

  NotificationResponseEntity({this.code, this.msg, this.data});

  NotificationResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(NotificationData.fromJson(v));
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

class NotificationData {
  String? content;
  String? createdAt;
  String? deletedAt;
  int? id;
  String? pic;
  String? title;
  String? updatedAt;
  String? userToken;

  NotificationData(
      {this.content,
        this.createdAt,
        this.deletedAt,
        this.id,
        this.pic,
        this.title,
        this.updatedAt,
        this.userToken});

  NotificationData.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    id = json['id'];
    pic = json['pic'];
    title = json['title'];
    updatedAt = json['updated_at'];
    userToken = json['user_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['created_at'] = createdAt;
    data['deleted_at'] = deletedAt;
    data['id'] = id;
    data['pic'] = pic;
    data['title'] = title;
    data['updated_at'] = updatedAt;
    data['user_token'] = userToken;
    return data;
  }
}