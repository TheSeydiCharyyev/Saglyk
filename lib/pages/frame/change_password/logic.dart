
import 'package:app/common/apis/user.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/routes/names.dart';
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

  handleSummit() async{
    final state = context.read<ChangePasswordBloc>().state;
    String password = state.password;
    String repassword = state.repassword;

    if(password.isEmpty){
      toastInfo(msg: "Password not empty!");
      return;
    }
    if(password.length<6){
      toastInfo(msg: "Password min length is 6!");
      return;
    }
    if(password != repassword){
      toastInfo(msg: "Password and Confirm password not Same !");
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();

    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    ChangePasswordRequestEntity entity =  ChangePasswordRequestEntity();
    entity.password = state.password;
    entity.repassword = state.repassword;
    try {
      var result = await UserAPI.changePassword(params: entity);
      EasyLoading.dismiss();
      toastInfo(msg: "${result.msg}");
      if (result.code == 0) {
        toastInfo(msg: "Log back into your account！");
        Global.storageService.remove(STORAGE_USER_PROFILE_KEY);
        Global.storageService.remove(STORAGE_USER_TOKEN_KEY);
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.Sign_in, (Route<dynamic> route) => false);
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(msg: 'internet error');
      Logger.write("$e");
    }

  }


}