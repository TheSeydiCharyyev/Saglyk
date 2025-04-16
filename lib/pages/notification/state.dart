part of 'bloc.dart';

class NotificationState {
  const NotificationState({
    this.message = const <NotificationData>[],
  });

  final List<NotificationData> message;

  NotificationState copyWith({
    List<NotificationData>? message,
  }) {
    return NotificationState(
      message: message ?? this.message,
    );
  }
}
