import 'package:app/common/entities/entities.dart';
import 'package:bloc/bloc.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageState()) {
    on<HeadDetailChanged>(_onHeadDetailChanged);
    on<TabStatusChanged>(_onTabStatusChanged);
    on<ChatListChanged>(_onChatListChanged);
  }

  void _onHeadDetailChanged(
      HeadDetailChanged event,
      Emitter<MessageState> emit,
      ) {
    emit(state.copyWith(headDetail: event.headDetail));
  }

  void _onTabStatusChanged(
      TabStatusChanged event,
      Emitter<MessageState> emit,
      ) {
    emit(state.copyWith(tabStatus: event.tabStatus));
  }

  void _onChatListChanged(
      ChatListChanged event,
      Emitter<MessageState> emit,
      ) {
    emit(state.copyWith(chatList: event.chatList));
  }

}
