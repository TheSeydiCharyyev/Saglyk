part of 'bloc.dart';

class HomeState {
  const HomeState({
    this.bannerList = const <BannerData>[],
    this.availableList = const <DoctorData>[],
    this.categoryList = const <CategoryData>[],
  });

  final List<BannerData> bannerList;
  final List<DoctorData> availableList;
  final List<CategoryData> categoryList;

  HomeState copyWith({
    List<BannerData>? bannerList,
    List<DoctorData>? availableList,
    List<CategoryData>? categoryList,
  }) {
    return HomeState(
      bannerList: bannerList ?? this.bannerList,
      availableList: availableList ?? this.availableList,
      categoryList: categoryList ?? this.categoryList,
    );
  }
}
