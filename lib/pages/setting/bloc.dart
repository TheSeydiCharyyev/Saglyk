import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<SettingState> emit) async {
    emit(state.clone());
  }
}
