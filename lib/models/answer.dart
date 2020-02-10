import 'package:json_annotation/json_annotation.dart';

import 'package:knctu/models/comment.dart';
import 'package:knctu/models/user.dart';

part 'answer.g.dart';

@JsonSerializable(explicitToJson: true)
class Answer {
  String id;
  String text;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  List<Comment> comments;
  User user;

  Answer(this.id, this.text, this.createdAt, this.comments, this.user);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
