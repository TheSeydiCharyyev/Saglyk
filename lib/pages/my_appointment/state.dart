part of 'bloc.dart';

class MyAppointmentState {
  const MyAppointmentState({
    this.history = const <ApppointData>[],
    this.page = 1,
  });

  final List<ApppointData> history;
  final int page;

  MyAppointmentState copyWith({
    List<ApppointData>? history,
    int? page,
  }) {
    return MyAppointmentState(
      history: history ?? this.history,
      page: page ?? this.page,
    );
  }
}
