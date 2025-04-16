import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/entities/notification.dart';

part 'event.dart';
part 'state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<NotificationChanged>(_onNotificationChanged);

  }

  void _onNotificationChanged(
      NotificationChanged event,
      Emitter<NotificationState> emit,
      ) {
    emit(state.copyWith(message: event.message));
  }

}
