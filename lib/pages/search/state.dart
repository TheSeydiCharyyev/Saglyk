part of 'bloc.dart';

class SearchState {
  const SearchState({
    this.searchList = const <DoctorData>[],
    this.availableList = const <DoctorData>[],
  });

  final List<DoctorData> searchList;
  final List<DoctorData> availableList;

  SearchState copyWith({
    List<DoctorData>? searchList,
    List<DoctorData>? availableList,
  }) {
    return SearchState(
      searchList: searchList ?? this.searchList,
      availableList: availableList ?? this.availableList,
    );
  }
}
