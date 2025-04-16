import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';

part 'event.dart';
part 'state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(const DoctorState()) {
    on<DoctorChanged>(_onDoctorChanged);
    on<CategoryChanged>(_onCategoryChanged);
    on<PageChanged>(_onPageChanged);
  }


  void _onDoctorChanged(
      DoctorChanged event,
      Emitter<DoctorState> emit,
      ) {
    emit(state.copyWith(doctorList: event.doctorList));
  }
  void _onCategoryChanged(
      CategoryChanged event,
      Emitter<DoctorState> emit,
      ) {
    emit(state.copyWith(categoryList: event.categoryList));
  }

  void _onPageChanged(
      PageChanged event,
      Emitter<DoctorState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }


}
