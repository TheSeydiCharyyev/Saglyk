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


  handleAll(int? categoryId) async{
    try {
      IdRequestEntity entity = IdRequestEntity();
      entity.id = categoryId;
      var result = await HomeAPI.getDoctor(params: entity);
      if (result.code == 0) {
        context.read<AllBloc>().add(AllChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }

  }



}