// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    json['id'] as String,
    json['text'] as String,
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    (json['answers'] as List)
        ?.map((e) =>
            e == null ? null : Answer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['upvote_count'] as int,
    json['view_count'] as int,
  )..infoUser = json['info_user'] == null
      ? null
      : InfoUser.fromJson(json['info_user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'upvote_count': instance.upvoteCount,
      'view_count': instance.viewCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'info_user': instance.infoUser?.toJson(),
      'answers': instance.answers?.map((e) => e?.toJson())?.toList(),
      'user': instance.user?.toJson(),
    };
