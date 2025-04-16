part of 'bloc.dart';

class AllState {
  const AllState({
    this.allList = const <DoctorData>[],
  });

  final List<DoctorData> allList;

  AllState copyWith({
    List<DoctorData>? allList,
  }) {
    return AllState(
      allList: allList ?? this.allList,
    );
  }
}
