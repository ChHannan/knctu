import 'package:json_annotation/json_annotation.dart';

import 'package:knctu/models/comment.dart';
import 'package:knctu/models/info_user.dart';
import 'package:knctu/models/user.dart';

part 'answer.g.dart';

@JsonSerializable(explicitToJson: true)
class Answer {
  String id;
  String text;

  @JsonKey(required: false, defaultValue: false)
  bool hasUpvoted;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'comments_count')
  int commentsCount;

  @JsonKey(name: 'upvote_count')
  int upvoteCount;

  @JsonKey(name: 'view_count')
  int viewCount;

  @JsonKey(name: 'info_user')
  InfoUser infoUser;

  List<Comment> comments;
  User user;

  Answer(this.id, this.text, this.createdAt, this.comments, this.user,
      this.commentsCount, this.hasUpvoted, this.upvoteCount, this.viewCount);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
