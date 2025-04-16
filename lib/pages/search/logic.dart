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


  handleSearch(String title) async{
    try {
      TitleRequestEntity entity = TitleRequestEntity();
      entity.title = title;
      var result = await HomeAPI.search(params: entity);
      if (result.code == 0) {
        context.read<SearchBloc>().add(SearchChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }

  }

  available() async{
    try {
      var result = await HomeAPI.available();
      if (result.code == 0) {
        context.read<SearchBloc>().add(AvailableChanged(result.data!));
      }
    } catch (e) {
      Logger.write("$e");
    }

  }



}