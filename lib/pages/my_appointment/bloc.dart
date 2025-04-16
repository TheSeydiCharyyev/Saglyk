import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';

part 'event.dart';
part 'state.dart';

class MyAppointmentBloc extends Bloc<MyAppointmentEvent, MyAppointmentState> {
  MyAppointmentBloc() : super(const MyAppointmentState()) {
    on<MyAppointmentChanged>(_onMyAppointmentChanged);
    on<PageChanged>(_onPageChanged);
  }

void _onMyAppointmentChanged(
      MyAppointmentChanged event,
      Emitter<MyAppointmentState> emit,
      ) {
    emit(state.copyWith(history: event.history));
  }

void _onPageChanged(
      PageChanged event,
      Emitter<MyAppointmentState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
