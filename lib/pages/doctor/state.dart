part of 'bloc.dart';

class DoctorState {
  const DoctorState({
    this.doctorList = const <DoctorData>[],
    this.categoryList = const <CategoryData>[],
    this.page = 0
  });

  final List<DoctorData> doctorList;
  final List<CategoryData> categoryList;
  final int page;


  DoctorState copyWith({
    List<DoctorData>? doctorList,
    List<CategoryData>? categoryList,
    int? page
  }) {
    return DoctorState(
      doctorList: doctorList ?? this.doctorList,
      categoryList: categoryList ?? this.categoryList,
      page:page ?? this.page
    );
  }
}
