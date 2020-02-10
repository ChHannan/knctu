import 'package:json_annotation/json_annotation.dart';

import 'package:knctu/models/user.dart';
import 'package:knctu/models/reply.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  String id;
  String text;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  List<Reply> replies;
  User user;

  Comment(this.id, this.text, this.createdAt, this.replies, this.user);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
