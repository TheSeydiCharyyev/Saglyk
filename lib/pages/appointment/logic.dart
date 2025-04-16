

import 'package:app/common/apis/home.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/common/widgets/widgets.dart';

import 'bloc.dart';

class Logic{
  final BuildContext context;
  Logic({
    required this.context,
  });

  init() async{
    dayChoose();
    try {
      var result = await HomeAPI.appointmentTime();
      if (result.code == 0) {
        context.read<AppointmentBloc>().add(MorningListChanged(result.data!.morning!));
        context.read<AppointmentBloc>().add(AfternoonListChanged(result.data!.afternoon!));
        context.read<AppointmentBloc>().add(EveningListChanged(result.data!.evening!));
      }
    } catch (e) {
      Logger.write("$e");
    }
  }

  dayChoose(){
    DateTime today = DateTime.now();
    List<NextDayItem> next7Days = [];
    List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    for (int i = 0; i < 7; i++) {
      DateTime futureDate = today.add(Duration(days: i+1));
      String dayOfWeek = weekdays[futureDate.weekday - 1];
      int dayOfMonth = futureDate.day;
      String dayOfDateTime = "${futureDate.year}-${futureDate.month.toString().padLeft(2, '0')}-${futureDate.day.toString().padLeft(2, '0')}";
      NextDayItem nextDay = NextDayItem();
      nextDay.day = dayOfMonth;
      nextDay.weekday = dayOfWeek;
      nextDay.daytime = dayOfDateTime;
      next7Days.add(nextDay);
    }
    context.read<AppointmentBloc>().add(DayListChanged(next7Days));
  }

  confirm(String token) async{
    final dayList = context.read<AppointmentBloc>().state.dayList;
    final morningList = context.read<AppointmentBloc>().state.morningList;
    final eveningList = context.read<AppointmentBloc>().state.eveningList;
    final afternoonList = context.read<AppointmentBloc>().state.afternoonList;
    List<String> combinedList = morningList + afternoonList + eveningList;
    final page1 = context.read<AppointmentBloc>().state.page1;
    final page2 = context.read<AppointmentBloc>().state.page2;
    var chooseDay = dayList.elementAt(page1);
    var chooseTime = combinedList.elementAt(page2);
    print(combinedList.toString());
    print(chooseDay.daytime);
    print(chooseTime);
    print(token);
    try {
      AppointmentRequestEntity entity = AppointmentRequestEntity();
      entity.token = token;
      entity.chooseDay = chooseDay.daytime;
      entity.chooseTime = chooseTime;
      var result = await HomeAPI.appointmentAdd(params: entity);
      toastInfo(msg: "${result.msg}");
      if (result.code == 0) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      Logger.write("$e");
    }
  }



}