

import 'package:app/common/apis/user.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/routes/routes.dart';
import 'package:app/common/utils/logger.dart';
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

  handleRegister() async{
    final state = context.read<RegisterBloc>().state;
    String UserName = state.username;
    String emailAddress = state.email;
    String password = state.password;

    if(UserName.isEmpty){
      toastInfo(msg: "UserName not empty!");
      return;
    }
    if(emailAddress.isEmpty){
      toastInfo(msg: "Email not empty!");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "Password not empty!");
      return;
    }
    if(password.length<6){
      toastInfo(msg: "Password min length is 6!");
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();

    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    RegisterRequestEntity entity =  RegisterRequestEntity();
    entity.password = state.password;
    entity.email = state.email;
    entity.name = state.username;
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var result = await UserAPI.register(params: entity);
      EasyLoading.dismiss();
      toastInfo(msg: "${result.msg}");
      if (result.code == 0) {
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.Sign_in, (Route<dynamic> route) => false);
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(msg: 'internet error');
      Logger.write("$e");
    }

  }


}