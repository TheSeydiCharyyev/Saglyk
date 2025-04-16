part of 'bloc.dart';

abstract class AllEvent {
  const AllEvent();
}

class AllChanged extends AllEvent {
  const AllChanged(this.allList);

  final List<DoctorData> allList;
}