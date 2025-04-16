class HistoryResponseEntity {
  int? code;
  List<HistoryData>? data;
  String? msg;

  HistoryResponseEntity({this.code, this.data, this.msg});

  HistoryResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <HistoryData>[];
      json['data'].forEach((v) {
        data!.add(HistoryData.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    return data;
  }
}

class HistoryData {
  int? id;
  String? title;
  String? thumbnail;
  String? description;
  int? brandId;
  String? price;
  int? oilNum;
  int? review;
  double? score;
  String? bookingHours;
  String? bookingZone;
  String? zone;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? historyId;

  HistoryData(
      {this.id,
        this.title,
        this.thumbnail,
        this.description,
        this.brandId,
        this.price,
        this.oilNum,
        this.review,
        this.score,
        this.bookingHours,
        this.bookingZone,
        this.zone,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.historyId});

  HistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    brandId = json['brand_id'];
    price = json['price'];
    oilNum = json['oil_num'];
    review = json['review'];
    score = json['score'];
    bookingHours = json['booking_hours'];
    bookingZone = json['booking_zone'];
    zone = json['zone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    historyId = json['history_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['description'] = description;
    data['brand_id'] = brandId;
    data['price'] = price;
    data['oil_num'] = oilNum;
    data['review'] = review;
    data['score'] = score;
    data['booking_hours'] = bookingHours;
    data['booking_zone'] = bookingZone;
    data['zone'] = zone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['history_id'] = historyId;
    return data;
  }
}