import 'package:json_annotation/json_annotation.dart';
import 'package:knctu/models/user.dart';

part 'message_user.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageUser {
  String id;
  User user;

  @JsonKey(name: 'is_read')
  bool isRead;

  MessageUser(this.id, this.user, this.isRead);
}
