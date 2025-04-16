
import 'package:app/common/apis/chat.dart';
import 'package:app/common/entities/message.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/services/socketchannel.dart';
import 'package:app/global.dart';
import 'package:app/pages/message/bloc/message_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageLogic with WidgetsBindingObserver {
  final BuildContext context;
  var userItem = Global.storageService.getUserProfile();

  MessageLogic({
    required this.context,
  });


  void init(){
    asyncLoadData();
    Global.eventBus.on<WebSocketEvent>().listen((event) {
      print(event.message);
      asyncLoadData();
    });
  }

  goChat(ChatData item) async{
    if (item.token != null) {
      var result = await Navigator.of(context).pushNamed(AppRoutes.Chat,arguments: {"to_token":item.token,"to_name":item.name,"to_avatar":item.avatar,});
      if (result == "finish") {
        asyncLoadData();
      }
    }
  }

  asyncLoadData() async {
    var result = await ChatAPI.userList();
    if (result.code == 0) {
      if(context.mounted){
        context.read<MessageBloc>().add(ChatListChanged(result.data!));
      }
    }
  }

}
