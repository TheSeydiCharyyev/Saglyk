import 'package:app/common/apis/home.dart';
import 'package:app/common/services/socketchannel.dart';
import 'package:app/common/utils/logger.dart';
import 'package:app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class Logic{
  final BuildContext context;
  Logic({
    required this.context,
  });

  init() async{
    Global.socketDbService = await SocketDbService().init();
    handleBanner();
    available();
    category();
  }

  handleBanner() async{
    try {
      var result = await HomeAPI.banner();
      if (result.code == 0) {
        context.read<HomeBloc>().add(BannerChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }

  }

  available() async{
    try {
      var result = await HomeAPI.available();
      if (result.code == 0) {
        context.read<HomeBloc>().add(AvailableChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }

  }

  category() async{
    try {
      var result = await HomeAPI.category();
      if (result.code == 0) {
        context.read<HomeBloc>().add(CategoryChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }

  }


}