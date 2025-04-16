part of 'bloc.dart';

class AppointmentState {
  const AppointmentState({
    this.page1 = 0,
    this.page2 = 0,
    this.morningList = const <String>[],
    this.afternoonList = const <String>[],
    this.eveningList = const <String>[],
    this.dayList = const <NextDayItem>[],
  });

  final int page1;
  final int page2;
  final List<String> morningList;
  final List<String> afternoonList;
  final List<String> eveningList;
  final List<NextDayItem> dayList;

  AppointmentState copyWith({
    int? page1,
    int? page2,
    List<String>? morningList,
    List<String>? afternoonList,
    List<String>? eveningList,
    List<NextDayItem>? dayList,
  }) {
    return AppointmentState(
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      morningList: morningList ?? this.morningList,
      afternoonList: afternoonList ?? this.afternoonList,
      eveningList: eveningList ?? this.eveningList,
      dayList: dayList ?? this.dayList,
    );
  }
}
