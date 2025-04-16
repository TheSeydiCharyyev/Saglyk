class CategoryResponseEntity {
  int? code;
  String? msg;
  List<CategoryData>? data;

  CategoryResponseEntity({this.code, this.msg, this.data});

  CategoryResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
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

class CategoryData {
  String? createdAt;
  String? deletedAt;
  String? description;
  int? id;
  String? thumbnail;
  String? title;
  String? updatedAt;

  CategoryData(
      {this.createdAt,
        this.deletedAt,
        this.description,
        this.id,
        this.thumbnail,
        this.title,
        this.updatedAt}
      );

  CategoryData.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    description = json['description'];
    id = json['id'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['deleted_at'] = deletedAt;
    data['description'] = description;
    data['id'] = id;
    data['thumbnail'] = thumbnail;
    data['title'] = title;
    data['updated_at'] = updatedAt;
    return data;
  }
}