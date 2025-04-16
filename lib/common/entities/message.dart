
class ChatRequestEntity {
  String? toToken;
  String? content;

  ChatRequestEntity({
    this.toToken,
    this.content,
  });

  Map<String, dynamic> toJson() => {
    "to_token": toToken,
    "content": content,
  };
}

class SendMessageResponseEntity {
  int? code;
  String? msg;
  Message? data;

  SendMessageResponseEntity({this.code, this.msg, this.data});

  SendMessageResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Message.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MessageResponseEntity {
  int? code;
  String? msg;
  List<Message>? data;

  MessageResponseEntity({this.code, this.msg, this.data});

  MessageResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Message>[];
      json['data'].forEach((v) {
        data!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? name;
  String? avatar;
  String? token;
  String? createdAt;
  String? toToken;
  String? content;

  Message(
      {this.name,
        this.avatar,
        this.token,
        this.createdAt,
        this.toToken,
        this.content});

  Message.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    token = json['token'];
    createdAt = json['created_at'];
    toToken = json['to_token'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    data['token'] = token;
    data['created_at'] = createdAt;
    data['to_token'] = toToken;
    data['content'] = content;
    return data;
  }
}

class ChatUserResponseEntity {
  int? code;
  String? msg;
  List<ChatData>? data;

  ChatUserResponseEntity({this.code, this.msg, this.data});

  ChatUserResponseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ChatData>[];
      json['data'].forEach((v) {
        data!.add(ChatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatData {
  String? avatar;
  String? email;
  String? lastMsg;
  String? lastTime;
  String? name;
  String? token;

  ChatData(
      {this.avatar,
        this.email,
        this.lastMsg,
        this.lastTime,
        this.name,
        this.token});

  ChatData.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    email = json['email'];
    lastMsg = json['last_msg'];
    lastTime = json['last_time'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['email'] = email;
    data['last_msg'] = lastMsg;
    data['last_time'] = lastTime;
    data['name'] = name;
    data['token'] = token;
    return data;
  }
}
