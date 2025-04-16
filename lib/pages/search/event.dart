part of 'bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class SearchChanged extends SearchEvent {
  const SearchChanged(this.searchList);

  final List<DoctorData> searchList;
}

class AvailableChanged extends SearchEvent {
  const AvailableChanged(this.availableList);

  final List<DoctorData> availableList;
}