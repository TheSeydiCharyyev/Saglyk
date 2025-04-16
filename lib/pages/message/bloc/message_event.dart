part of 'message_bloc.dart';

abstract class MessageEvent {
  const MessageEvent();

}

class HeadDetailChanged extends MessageEvent {
  const HeadDetailChanged(this.headDetail);

  final UserItem headDetail;

}
class TabStatusChanged extends MessageEvent {
  const TabStatusChanged(this.tabStatus);

  final bool tabStatus;

}
class ChatListChanged extends MessageEvent {
  const ChatListChanged(this.chatList);

  final List<ChatData> chatList;

}


