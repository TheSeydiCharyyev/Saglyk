import 'package:app/common/entities/message.dart';
import 'package:bloc/bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ProfileChanged>(_onProfileChanged);
    on<MsgContentListChanged>(_onMsgContentListChanged);
    on<isloadingChanged>(_onIsloadingChanged);
    on<moreStatusChanged>(_onMoreStatusChanged);
    on<MsgContentAdd>(_onMsgContentAdd);
    on<MsgContentClear>(_onMsgContentClear);

  }

  void _onProfileChanged(
      ProfileChanged event,
      Emitter<ChatState> emit,
      ) {
    //to_token,to_name,to_avatar
    emit(state.copyWith(to_token: event.to_token,to_name:event.to_name,to_avatar:event.to_avatar));
  }

  void _onMsgContentListChanged(
      MsgContentListChanged event,
      Emitter<ChatState> emit,
      ) {
    var res = state.msgcontentList.toList();
    res.insert(0, event.msgContentList);
    emit(state.copyWith(msgcontentList: res));
  }

  void _onMsgContentAdd(
      MsgContentAdd event,
      Emitter<ChatState> emit,
      ) {
       var res = state.msgcontentList.toList();
       res.add(event.msgContent);
    emit(state.copyWith(msgcontentList: res));
  }
  void _onMsgContentClear(
      MsgContentClear event,
      Emitter<ChatState> emit,
      ) {
    emit(state.copyWith(msgcontentList: []));
  }

  void _onIsloadingChanged(
      isloadingChanged event,
      Emitter<ChatState> emit,
      ) {
    emit(state.copyWith(isloading: event.isloading));
  }

  void _onMoreStatusChanged(
      moreStatusChanged event,
      Emitter<ChatState> emit,
      ) {
    emit(state.copyWith(more_status: event.more_status));
  }




}
