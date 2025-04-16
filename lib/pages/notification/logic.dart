

import 'package:app/common/apis/home.dart';
import 'package:app/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class Logic{
  final BuildContext context;
  Logic({
    required this.context,
  });

  notification() async{
    try {
      var result = await HomeAPI.notification();
      if (result.code == 0) {
        context.read<NotificationBloc>().add(NotificationChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }
  }



}