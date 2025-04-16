
class LoginRequestEntity {
  String? password;
  String? email;

  LoginRequestEntity({
    this.password,
    this.email,
  });

  Map<String, dynamic> toJson() => {
    "password": password,
    "email": email,
  };
}

class RegisterRequestEntity {
  String? password;
  String? email;
  String? name;

  RegisterRequestEntity({
    this.password,
    this.email,
    this.name,
  });

  Map<String, dynamic> toJson() => {
    "password": password,
    "email": email,
    "name": name,
  };
}
class ProfileRequestEntity {
  int? gender;
  String? birthday;
  String? description;
  String? phone;
  String? name;

  ProfileRequestEntity({
    this.gender,
    this.birthday,
    this.description,
    this.phone,
    this.name,
  });

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "birthday": birthday,
    "description": description,
    "phone": phone,
    "name": name,
  };
}
class ChangePasswordRequestEntity {
  String? password;
  String? repassword;

  ChangePasswordRequestEntity({
    this.password,
    this.repassword,
  });

  Map<String, dynamic> toJson() => {
    "password": password,
    "repassword": repassword,
  };
}

class UserLoginResponseEntity {
  int? code;
  UserItem? data;
  String? msg;

  UserLoginResponseEntity({this.code, this.data, this.msg});

  UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? UserItem.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    return data;
  }
}

class UserItem {
  String? accessToken;
  String? avatar;
  String? createdAt;
  String? description;
  String? email;
  int? gender;
  int? id;
  String? name;
  String? token;
  String? updatedAt;

  UserItem(
      {this.accessToken,
        this.avatar,
        this.createdAt,
        this.description,
        this.email,
        this.gender,
        this.id,
        this.name,
        this.token,
        this.updatedAt});

  UserItem.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    description = json['description'];
    email = json['email'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    token = json['token'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['avatar'] = avatar;
    data['created_at'] = createdAt;
    data['description'] = description;
    data['email'] = email;
    data['gender'] = gender;
    data['id'] = id;
    data['name'] = name;
    data['token'] = token;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class WishlistResponseEntity {
  int? code;
  List<WishlistData>? data;
  String? msg;

  WishlistResponseEntity({this.code, this.data, this.msg});

  WishlistResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <WishlistData>[];
      json['data'].forEach((v) {
        data!.add(WishlistData.fromJson(v));
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

class WishlistData {
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
  int? wishlistId;

  WishlistData(
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
        this.wishlistId});

  WishlistData.fromJson(Map<String, dynamic> json) {
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
    wishlistId = json['wishlist_id'];
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
    data['wishlist_id'] = wishlistId;
    return data;
  }
}



