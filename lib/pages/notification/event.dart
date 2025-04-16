part of 'bloc.dart';

abstract class NotificationEvent {
  const NotificationEvent();
}

class NotificationChanged extends NotificationEvent {
  const NotificationChanged(this.message);

  final List<NotificationData> message;
}
