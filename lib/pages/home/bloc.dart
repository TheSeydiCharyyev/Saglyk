import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';

part 'event.dart';
part 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<BannerChanged>(_onBannerChanged);
    on<AvailableChanged>(_onAvailableChanged);
    on<CategoryChanged>(_onCategoryChanged);

  }

  void _onBannerChanged(
      BannerChanged event,
      Emitter<HomeState> emit,
      ) {
    emit(state.copyWith(bannerList: event.bannerList));
  }

  void _onAvailableChanged(
      AvailableChanged event,
      Emitter<HomeState> emit,
      ) {
    emit(state.copyWith(availableList: event.availableList));
  }

  void _onCategoryChanged(
      CategoryChanged event,
      Emitter<HomeState> emit,
      ) {
    emit(state.copyWith(categoryList: event.categoryList));
  }



}
