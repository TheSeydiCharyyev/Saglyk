import 'package:app/common/apis/chat.dart';
import 'package:app/common/apis/home.dart';
import 'package:app/common/entities/base.dart';
import 'package:app/common/entities/doctor.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class Logic{
  final BuildContext context;
  Logic({
    required this.context,
  });

  handleInit(int? id) async{
    try {
      IdRequestEntity entity = IdRequestEntity();
      entity.id = id;
      var result = await HomeAPI.detail(params: entity);
      if (result.code == 0) {
        context.read<DetailBloc>().add(DetailChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }

  }

  goMessage(DoctorData item) async{
    try {
      TokenRequestEntity entity = TokenRequestEntity();
      entity.token = item.token;
      await ChatAPI.addDoctorUser(params: entity);
    } catch (e) {
      Logger.write("$e");
    }
    Navigator.of(context).pushNamed(AppRoutes.Chat,arguments: {"to_token":item.token,"to_name":item.name,"to_avatar":item.avatar,});

  }





}