import 'package:app/common/entities/entities.dart';
import 'package:app/common/utils/utils.dart';

class HomeAPI {
  static Future<BannerResponseEntity> banner() async {
    var response = await HttpUtil().post('api/banner_list');
    return BannerResponseEntity.fromJson(response);
  }

  static Future<CategoryResponseEntity> category() async {
    var response = await HttpUtil().post('api/get_category');
    return CategoryResponseEntity.fromJson(response);
  }

  static Future<DoctorResponseEntity> available() async {
    var response = await HttpUtil().post('api/available');
    return DoctorResponseEntity.fromJson(response);
  }

  static Future<DoctorResponseEntity> getDoctor({
    IdRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/get_doctor',
      data: params?.toJson(),
    );
    return DoctorResponseEntity.fromJson(response);
  }

  static Future<DoctorDetailResponseEntity> detail({
    IdRequestEntity? params,
  }) async {
    var response = await HttpUtil().post('api/detail', data: params?.toJson());
    return DoctorDetailResponseEntity.fromJson(response);
  }

  static Future<DoctorResponseEntity> search({
    TitleRequestEntity? params,
  }) async {
    var response = await HttpUtil().post('api/search', data: params?.toJson());
    return DoctorResponseEntity.fromJson(response);
  }

  static Future<NotificationResponseEntity> notification() async {
    var response = await HttpUtil().post('api/notification');
    return NotificationResponseEntity.fromJson(response);
  }

  static Future<AppointmentTimeResponseEntity> appointmentTime() async {
    var response = await HttpUtil().post('api/appointment_time');
    return AppointmentTimeResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> appointmentAdd({
    AppointmentRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/appointment_add',
      data: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> appointmentCancel({
    IdRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/appointment_cancel',
      data: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<ApppointResponseEntity> appointmentList({
    IdRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/appointment_list',
      data: params?.toJson(),
    );
    return ApppointResponseEntity.fromJson(response);
  }
}
