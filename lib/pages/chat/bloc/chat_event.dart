part of 'chat_bloc.dart';

abstract class ChatEvent {
  const ChatEvent();

  List<Object> get props => [];
}

class ProfileChanged extends ChatEvent {
  const ProfileChanged(this.to_token, this.to_name, this.to_avatar);

  final String to_token;
  final String to_name;
  final String to_avatar;
}

class MsgContentListChanged extends ChatEvent {
  const MsgContentListChanged(this.msgContentList);

  final Message msgContentList;
}

class MsgContentAdd extends ChatEvent {
  const MsgContentAdd(this.msgContent);

  final Message msgContent;
}

class MsgContentClear extends ChatEvent {
  const MsgContentClear();
}

class isloadingChanged extends ChatEvent {
  const isloadingChanged(this.isloading);

  final bool isloading;
}

class moreStatusChanged extends ChatEvent {
  const moreStatusChanged(this.more_status);

  final bool more_status;
}
