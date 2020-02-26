import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String name;
  String email;
  String title;
  String avatar;

  @JsonKey(name: 'question_count')
  int questionCount;

  @JsonKey(name: 'answer_count')
  int answerCount;

  User(this.id, this.name, this.email, this.title, this.avatar,
      this.questionCount, this.answerCount);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
