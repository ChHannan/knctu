import 'package:json_annotation/json_annotation.dart';

import 'package:knctu/models/user.dart';
import 'package:knctu/models/message.dart';

part 'chat_room.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatRoom {
  String id;
  String name;

  List<Message> messages;
  List<User> users;

  ChatRoom(this.id, this.name, this.users, this.messages);
}

