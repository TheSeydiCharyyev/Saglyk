import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';

part 'event.dart';
part 'state.dart';

class AllBloc extends Bloc<AllEvent, AllState> {
  AllBloc() : super(const AllState()) {
    on<AllChanged>(_onAllChanged);

  }

  void _onAllChanged(
      AllChanged event,
      Emitter<AllState> emit,
      ) {
    emit(state.copyWith(allList: event.allList));
  }



}
