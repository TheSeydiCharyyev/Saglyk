

import 'package:app/common/apis/home.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class Logic{
  final BuildContext context;
  Logic({
    required this.context,
  });

  init(int? page) async{
    try {
      IdRequestEntity entity = IdRequestEntity();
      entity.id = page;
      var result = await HomeAPI.appointmentList(params: entity);
      if (result.code == 0) {
        context.read<MyAppointmentBloc>().add(MyAppointmentChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }
  }

  goCancel(int? id) async{
    try {
      IdRequestEntity entity = IdRequestEntity();
      entity.id = id;
      var result = await HomeAPI.appointmentCancel(params: entity);
      if (result.code == 0) {
        init(1);
      }
    } catch (e) {
      Logger.write("$e");
    }
  }



}