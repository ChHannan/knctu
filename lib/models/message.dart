import 'package:json_annotation/json_annotation.dart';

import 'package:knctu/models/user.dart';
import 'package:knctu/models/message_user.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {
  String id;
  String text;
  User user;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'message_users')
  List<MessageUser> messageUsers;

  Message(this.id, this.text, this.user, this.createdAt,
      this.messageUsers);
}
