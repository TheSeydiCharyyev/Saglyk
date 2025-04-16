part of 'bloc.dart';
class DetailState {
  const DetailState({
    this.detail,
  });
  final DoctorData? detail;

  DetailState copyWith({
    DoctorData? detail,
  }) {
    return DetailState(
      detail: detail ?? this.detail,
    );
  }
}
