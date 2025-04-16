import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';

part 'event.dart';
part 'state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchChanged>(_onSearchChanged);
    on<AvailableChanged>(_onAvailableChanged);
  }

  void _onSearchChanged(
      SearchChanged event,
      Emitter<SearchState> emit,
      ) {
    emit(state.copyWith(searchList: event.searchList));
  }

  void _onAvailableChanged(
      AvailableChanged event,
      Emitter<SearchState> emit,
      ) {
    emit(state.copyWith(availableList: event.availableList));
  }




}
