part of 'bloc.dart';

abstract class MyAppointmentEvent {
  const MyAppointmentEvent();
}

class MyAppointmentChanged extends MyAppointmentEvent {
  const MyAppointmentChanged(this.history);

  final List<ApppointData> history;
}

class PageChanged extends MyAppointmentEvent {
  const PageChanged(this.page);

  final int page;
}