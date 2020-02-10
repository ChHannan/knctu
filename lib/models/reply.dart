import 'package:json_annotation/json_annotation.dart';
import 'package:knctu/models/user.dart';

part 'reply.g.dart';

@JsonSerializable(explicitToJson: true)
class Reply {
  String id;
  String text;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  User user;

  Reply(this.id, this.text, this.createdAt, this.user);


  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyToJson(this);
}
