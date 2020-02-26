// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['name'] as String,
    json['email'] as String,
    json['title'] as String,
    json['avatar'] as String,
    json['question_count'] as int,
    json['answer_count'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'title': instance.title,
      'avatar': instance.avatar,
      'question_count': instance.questionCount,
      'answer_count': instance.answerCount,
    };
