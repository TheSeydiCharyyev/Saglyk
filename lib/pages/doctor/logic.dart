import 'package:app/common/apis/home.dart';
import 'package:app/common/entities/base.dart';
import 'package:app/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class Logic{
  final BuildContext context;
  Logic({
    required this.context,
  });

  init(){
    category();
    getDoctor(1);
  }

  category() async{
    try {
      var result = await HomeAPI.category();
      if (result.code == 0) {
        context.read<DoctorBloc>().add(CategoryChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }

  }

  getDoctor(int? categoryId) async{
    try {
      IdRequestEntity entity = IdRequestEntity();
      entity.id = categoryId;
      var result = await HomeAPI.getDoctor(params: entity);
      if (result.code == 0) {
        context.read<DoctorBloc>().add(DoctorChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }
  }



}