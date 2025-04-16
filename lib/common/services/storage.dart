import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/values/constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  String getUserToken() {
    return _prefs.getString(STORAGE_USER_TOKEN_KEY) ?? "";
  }
  bool getDeviceFirstOpen() {
    return _prefs.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY) ?? false;
  }
  bool getIsLogin() {
    return _prefs.getString(STORAGE_USER_TOKEN_KEY)==null?false:true;
  }
  UserItem getUserProfile() {
    var profileOffline = _prefs.getString(STORAGE_USER_PROFILE_KEY)??"";
    if(profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return UserItem();
  }



}
