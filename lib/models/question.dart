import 'package:json_annotation/json_annotation.dart';

import 'package:knctu/models/answer.dart';
import 'package:knctu/models/info_user.dart';
import 'package:knctu/models/user.dart';

part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question {
  String id;
  String text;

  @JsonKey(name: 'upvote_count')
  int upvoteCount;

  @JsonKey(name: 'view_count')
  int viewCount;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'info_user')
  InfoUser infoUser;

  List<Answer> answers;
  User user;

  Question(this.id, this.text, this.createdAt, this.answers, this.user,
      this.upvoteCount, this.viewCount);


  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
