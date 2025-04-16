import 'dart:async';
import 'dart:io';
import 'package:app/common/apis/chat.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/services/socketchannel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app/common/entities/entities.dart';
import 'package:app/common/utils/utils.dart';
import 'package:app/common/widgets/widgets.dart';
import 'package:app/global.dart';
import 'package:app/pages/chat/bloc/chat_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChatLogic {
  final BuildContext context;

  UserItem userProfile = Global.storageService.getUserProfile();

  TextEditingController myinputController = TextEditingController();
  ScrollController myscrollController = ScrollController();
  ScrollController inputScrollController = ScrollController();
  bool isloadmore = true;
  double inputHeightStatus = 0;
  File? _photo;
  final ImagePicker _picker = ImagePicker();


  ChatLogic({
    required this.context,
  });

  void init() async{
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    context.read<ChatBloc>().add(ProfileChanged(data["to_token"]??"",data["to_name"]??"",data["to_avatar"]??""));
    privateMessageData(data["to_token"]);
    Global.eventBus.on<WebSocketEvent>().listen((event) {
      webSocketOnMessage(event.message);
    });
  }

  void dispose(){
    print("--------dispose");

    myinputController.dispose();
    inputScrollController.dispose();
  }

  /// WebSocket接收消息回调
  webSocketOnMessage(Message data) {
    if(context.mounted){
      String? token = data.token;
      String? toToken = data.toToken;
      String friendId = context.read<ChatBloc>().state.to_token;
      String? myId = userProfile.token;
      if(token==friendId && toToken==myId){
        context.read<ChatBloc>().add(MsgContentListChanged(data));
      }
    }
  }

  privateMessageData(String token) async{
    TokenRequestEntity entity =  TokenRequestEntity();
    entity.token = token;
    var res = await ChatAPI.privateMessage(params: entity);
    if(res.code==0){
      context.read<ChatBloc>().add(MsgContentClear());
      for(var item in res.data!){
        context.read<ChatBloc>().add(MsgContentListChanged(item));
      }
    }
  }

  Future imgFromGallery() async {
    if(Platform.isIOS) {
      bool photosStatus = await request_permission(Permission.photos);
      if(!photosStatus){
        return;
      }
    }
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadFile(pickedFile);
    } else {
      print('No image selected.');
    }
  }

  Future imgFromCamera() async {
    bool cameraStatus = await request_permission(Permission.camera);
    if(cameraStatus) {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        uploadFile(pickedFile);
      } else {
        print('No image selected.');
      }
    }
  }

  Future uploadFile(XFile file) async {

    var result = await ChatAPI.upload_img(file:file);
    if(result.code==0){
      print(result.data);
      String content = "img[${result.data}]";
      print(content);
      sendMessage(content,"image");
    }else{
      toastInfo(msg: "image error");
    }
  }

  sendContent(){
    String sendcontent = myinputController.text;
    print(sendcontent);
    myinputController.clear();
    sendMessage(sendcontent,"text");
  }

  sendMessage(String sendcontent,String contentType) async{

    print("---------------chat-----------------");

    if(sendcontent.isEmpty){
      toastInfo(msg: "content not empty");
      return;
    }
    String toToken = context.read<ChatBloc>().state.to_token;
    ChatRequestEntity entity = ChatRequestEntity();
    entity.content = sendcontent;
    entity.toToken = toToken;
    var res = await ChatAPI.sendMessage(params: entity);
    print(res.data);
    if(res.code==0 && res.data!=null){
      context.read<ChatBloc>().add(MsgContentListChanged(res.data!));
    }else{
      toastInfo(msg: "${res.msg}");
    }

  }


  close_all_pop() async{
    FocusManager.instance.primaryFocus?.unfocus();
    print("------close_all_pop");
  }

  photoImg(Message item){
     Navigator.of(context).pushNamed(AppRoutes.Photoimgview,arguments: {"url": item.content});
  }



}
