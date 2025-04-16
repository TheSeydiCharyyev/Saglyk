import 'package:app/common/entities/message.dart';
import 'package:app/common/values/constant.dart';
import 'package:app/global.dart';
import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// WebSocket地址
const String _SOCKET_URL = SERVER_API_WSS;

/// WebSocket状态
enum SocketStatus {
  SocketStatusConnected, // 已连接
  SocketStatusFailed, // 失败
  SocketStatusClosed, // 连接关闭
}

class WebSocketEvent {
  final Message message;
  WebSocketEvent(this.message);
}

class SocketDbService {
  IOWebSocketChannel? _webSocket; // WebSocket
  SocketStatus? _socketStatus; // socket状态
  Timer? _heartBeat; // 心跳定时器
  final int _heartTimes = 10000; // 心跳间隔(毫秒)
  final int _reconnectCount = 60; // 重连次数，默认60次
  int _reconnectTimes = 0; // 重连计数器
  Timer? _reconnectTimer; // 重连定时器

  Future<SocketDbService> init() async {
    openSocket();
    return this;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken!="") {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  /// 开启WebSocket连接
  void openSocket() {
    closeSocket();
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    _webSocket = IOWebSocketChannel.connect(_SOCKET_URL,headers:authorization);
    print('WebSocket连接成功: $_SOCKET_URL');
    // 连接成功，返回WebSocket实例
    _socketStatus = SocketStatus.SocketStatusConnected;
    // 连接成功，重置重连计数器
    _reconnectTimes = 0;
    if (_reconnectTimer != null) {
      _reconnectTimer!.cancel();
      _reconnectTimer = null;
    }
    initHeartBeat();
    // 接收消息
    _webSocket!.stream.listen((message) {
      print('-- 新消息: $message');
      Map<String, dynamic> result = jsonDecode(message);
      Message res = Message.fromJson(result);
      Global.eventBus.fire(WebSocketEvent(res));

    }, onError: webSocketOnError, onDone: webSocketOnDone);
  }

  /// WebSocket关闭连接回调
  webSocketOnDone() {
    print('WebSocket closed');
    bool isLogin = Global.storageService.getIsLogin();
    if(isLogin){
      reconnect();
    }
  }

  /// WebSocket连接错误回调
  webSocketOnError(e) {
    WebSocketChannelException ex = e;
    _socketStatus = SocketStatus.SocketStatusFailed;
    print(ex.message);
    closeSocket();
  }

  /// 初始化心跳
  void initHeartBeat() {
    destroyHeartBeat();
    _heartBeat = Timer.periodic(Duration(milliseconds: _heartTimes), (timer) {
      sentHeart();
    });
  }

  /// 心跳
  void sentHeart() {
    // '{"module": "HEART_CHECK", "message": "请求心跳"}'
    sendMessage('{"type": "ping", "data": ""}');
  }

  /// 销毁心跳
  void destroyHeartBeat() {
    if (_heartBeat != null) {
      _heartBeat!.cancel();
      _heartBeat = null;
    }
  }

  /// 关闭WebSocket
  void closeSocket() {
    if (_webSocket != null) {
      print('WebSocket连接关闭');
      _webSocket!.sink.close();
      destroyHeartBeat();
      _socketStatus = SocketStatus.SocketStatusClosed;
    }
  }

  /// 发送WebSocket消息
  void sendMessage(message) {
    if (_webSocket != null) {
      switch (_socketStatus) {
        case SocketStatus.SocketStatusConnected:
        // print('发送中：' + message);
          _webSocket!.sink.add(message);
          break;
        case SocketStatus.SocketStatusClosed:
          print('连接已关闭');
          break;
        case SocketStatus.SocketStatusFailed:
          print('发送失败');
          break;
        default:
          break;
      }
    }
  }


  /// 重连机制
  void reconnect() {
    if (_reconnectTimes < _reconnectCount) {
      _reconnectTimes++;
      print("reconnect start $_reconnectTimes");
      _reconnectTimer = Timer.periodic(Duration(milliseconds: _heartTimes), (timer) {
        openSocket();
      });
    } else {
      if (_reconnectTimer != null) {
        print('重连次数超过最大次数');
        _reconnectTimer!.cancel();
        _reconnectTimer = null;
      }
      return;
    }
  }

}
