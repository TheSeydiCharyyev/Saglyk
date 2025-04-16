import 'package:app/common/entities/entities.dart';
import 'package:bloc/bloc.dart';

part 'event.dart';
part 'state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(const AppointmentState()) {
    on<Page1Changed>(_onPage1Changed);
    on<Page2Changed>(_onPage2Changed);
    on<MorningListChanged>(_onMorningListChanged);
    on<AfternoonListChanged>(_onAfternoonListChanged);
    on<EveningListChanged>(_onEveningListChanged);
    on<DayListChanged>(_onDayListChanged);

  }

  void _onPage1Changed(
      Page1Changed event,
      Emitter<AppointmentState> emit,
      ) {
    emit(state.copyWith(page1: event.page1));
  }

  void _onPage2Changed(
      Page2Changed event,
      Emitter<AppointmentState> emit,
      ) {
    emit(state.copyWith(page2: event.page2));
  }

  void _onMorningListChanged(
      MorningListChanged event,
      Emitter<AppointmentState> emit,
      ) {
    emit(state.copyWith(morningList: event.morningList));
  }

  void _onAfternoonListChanged(
      AfternoonListChanged event,
      Emitter<AppointmentState> emit,
      ) {
    emit(state.copyWith(afternoonList: event.afternoonList));
  }


  void _onEveningListChanged(
      EveningListChanged event,
      Emitter<AppointmentState> emit,
      ) {
    emit(state.copyWith(eveningList: event.eveningList));
  }

  void _onDayListChanged(
      DayListChanged event,
      Emitter<AppointmentState> emit,
      ) {
    emit(state.copyWith(dayList: event.dayList));
  }

}
