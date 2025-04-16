import 'package:bloc/bloc.dart';
part 'event.dart';
part 'state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(
      PageChanged event,
      Emitter<ApplicationState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }
}
