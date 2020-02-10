import 'package:json_annotation/json_annotation.dart';

import 'package:knctu/models/answer.dart';
import 'package:knctu/models/user.dart';

part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question {
  String id;
  String text;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  List<Answer> answers;
  User user;

  Question(this.id, this.text, this.createdAt, this.answers, this.user);


  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
