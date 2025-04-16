
import 'dart:convert';

import 'package:app/common/apis/user.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/utils/logger.dart';
import 'package:app/common/values/constant.dart';
import 'package:app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/common/widgets/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'bloc.dart';

class Logic{
  final BuildContext context;
  Logic({
    required this.context,
  });

  handleProfile() async{
    final userItem = context.read<AccountBloc>().state.userProfile;
    FocusManager.instance.primaryFocus?.unfocus();
    EasyLoading.show(indicator: const CircularProgressIndicator(), maskType: EasyLoadingMaskType.clear, dismissOnTap: true);
    ProfileRequestEntity entity =  ProfileRequestEntity();
    entity.name = userItem?.name;
    entity.gender = userItem?.gender;
    entity.description = userItem?.description;
    try {
      var result = await UserAPI.updateProfile(params: entity);
      EasyLoading.dismiss();
      toastInfo(msg: "${result.msg}");
      if (result.code == 0) {
        if(userItem!=null) {
          Global.storageService.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(userItem));
        }
        Navigator.of(context).pop();
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(msg: 'internet error');
      Logger.write("$e");
    }

  }


}