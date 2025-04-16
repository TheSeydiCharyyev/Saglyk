part of 'bloc.dart';

abstract class DetailEvent {
  const DetailEvent();
}

class DetailChanged extends DetailEvent {
  const DetailChanged(this.detail);

  final DoctorData detail;

}