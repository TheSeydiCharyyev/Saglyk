part of 'bloc.dart';

abstract class DoctorEvent {
  const DoctorEvent();
}


class DoctorChanged extends DoctorEvent {
  const DoctorChanged(this.doctorList);

  final List<DoctorData> doctorList;
}

class CategoryChanged extends DoctorEvent {
  const CategoryChanged(this.categoryList);

  final List<CategoryData> categoryList;
}

class PageChanged extends DoctorEvent {
  const PageChanged(this.page);

  final int page;
}