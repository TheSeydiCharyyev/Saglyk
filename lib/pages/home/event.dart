part of 'bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class BannerChanged extends HomeEvent {
  const BannerChanged(this.bannerList);

  final List<BannerData> bannerList;
}

class AvailableChanged extends HomeEvent {
  const AvailableChanged(this.availableList);

  final List<DoctorData> availableList;
}


class CategoryChanged extends HomeEvent {
  const CategoryChanged(this.categoryList);

  final List<CategoryData> categoryList;
}