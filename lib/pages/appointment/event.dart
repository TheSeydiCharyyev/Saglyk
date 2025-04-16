part of 'bloc.dart';

abstract class AppointmentEvent {
  const AppointmentEvent();
}

class Page1Changed extends AppointmentEvent {
  const Page1Changed(this.page1);

  final int page1;
}

class Page2Changed extends AppointmentEvent {
  const Page2Changed(this.page2);

  final int page2;
}

class MorningListChanged extends AppointmentEvent {
  const MorningListChanged(this.morningList);

  final List<String> morningList;
}

class AfternoonListChanged extends AppointmentEvent {
  const AfternoonListChanged(this.afternoonList);

  final List<String> afternoonList;
}

class EveningListChanged extends AppointmentEvent {
  const EveningListChanged(this.eveningList);

  final List<String> eveningList;
}

class DayListChanged extends AppointmentEvent {
  const DayListChanged(this.dayList);

  final List<NextDayItem> dayList;
}