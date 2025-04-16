part of 'chat_bloc.dart';

class ChatState {
  const ChatState({
    this.to_token="",
    this.to_name="",
    this.to_avatar="",
    this.isloading = false,
    this.more_status = false,
    this.msgcontentList = const <Message>[],
  });

  final String to_token;
  final String to_name;
  final String to_avatar;
  final bool isloading;
  final bool more_status;
  final List<Message> msgcontentList;


  ChatState copyWith({
    String? to_token,
    String? to_name,
    String? to_avatar,
    bool? isloading,
    bool? more_status,
    List<Message>? msgcontentList,
  }) {
    return ChatState(
      to_token: to_token ?? this.to_token,
      to_name: to_name ?? this.to_name,
      to_avatar: to_avatar ?? this.to_avatar,

      isloading: isloading ?? this.isloading,
      more_status: more_status ?? this.more_status,
      msgcontentList: msgcontentList ?? this.msgcontentList,
    );
  }
}
