part of 'message_bloc.dart';

class MessageState {
  const MessageState({
    this.tabStatus = true,
    this.headDetail,
    this.chatList = const <ChatData>[],
  });

  final bool tabStatus;
  final UserItem? headDetail;
  final List<ChatData> chatList;

  MessageState copyWith({
    bool? tabStatus,
    UserItem? headDetail,
    List<ChatData>? chatList,
  }) {
    return MessageState(
      tabStatus: tabStatus ?? this.tabStatus,
      headDetail: headDetail ?? this.headDetail,
      chatList: chatList ?? this.chatList,
    );
  }
}
