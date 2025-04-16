import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:app/common/apis/apis.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/routes/routes.dart';
import 'package:app/common/utils/utils.dart';
import 'package:app/common/values/constant.dart';
import 'package:app/common/widgets/widgets.dart';
import 'package:app/global.dart';

import 'bloc.dart';

class Logic {
  final BuildContext context;

  Logic({
    required this.context,
  });

  asyncPostAllData() async {
    var state = context.read<SignInBloc>().state;
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    LoginRequestEntity loginRequestEntity = LoginRequestEntity();
    loginRequestEntity.password = state.password;
    loginRequestEntity.email = state.email;
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var result = await UserAPI.Login(params: loginRequestEntity);
      if (result.code == 0) {
        Global.storageService
            .setString(STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        Global.storageService
            .setString(STORAGE_USER_TOKEN_KEY, result.data!.accessToken!);
        EasyLoading.dismiss();
        Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.Application, (Route<dynamic> route) => false);
      } else {
        EasyLoading.dismiss();
        toastInfo(msg: '${result.msg}');
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(msg: 'internet error');
      Logger.write("$e");
    }
  }
}
