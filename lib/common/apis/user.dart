import 'package:app/common/entities/entities.dart';
import 'package:app/common/utils/utils.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> Login({
    LoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/login',
      data: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> register({
    RegisterRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/register',
      data: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> changePassword({
    ChangePasswordRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/change_password',
      data: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<UserLoginResponseEntity> getProfile() async {
    var response = await HttpUtil().post(
      'api/get_profile',
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> updateProfile({
    ProfileRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/update_profile',
      data: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }


}
