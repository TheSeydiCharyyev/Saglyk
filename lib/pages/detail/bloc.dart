import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';

part 'event.dart';
part 'state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailState()) {
    on<DetailChanged>(_onDetailChanged);
  }
  void _onDetailChanged(
      DetailChanged event,
      Emitter<DetailState> emit,
      ) {
    emit(state.copyWith(detail: event.detail));
  }
}
