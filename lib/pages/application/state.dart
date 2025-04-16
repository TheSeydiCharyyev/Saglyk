part of 'bloc.dart';

class ApplicationState {
  const ApplicationState({
    this.page=0,
  });

  final int page;

  ApplicationState copyWith({
    int? page,
  }) {
    return ApplicationState(
      page: page ?? this.page,
    );
  }
}
