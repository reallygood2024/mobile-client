import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class Message {
  late String id;
  late types.User sender;
  late String reply;
  late String channel;
  late String name;
  late String content;
  late int state;
  late bool showstate;
  late int type;
  late int size;
  late String mimetype;
  late DateTime create;
  late DateTime update;

  types.ImageMessage ToImage(){
    return types.ImageMessage(
      author: sender, 
      uri: content, 
      size: size, 
      name: name,
      id: id,
    );
  }

  types.TextMessage ToText(){
    return types.TextMessage(
      author: sender, 
      text: content,
      id: id, 
    );
  }

  types.FileMessage ToFile(){
    return types.FileMessage(
      author: sender, 
      uri: content, 
      size: size, 
      name: name, 
      id: id,
    );
  }
}

class ChatRoom {
  List<Message> messages = [];

  // TODO Received channel id from server
  // TODO Received message list from server
}