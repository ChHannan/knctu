// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    json['id'] as String,
    json['text'] as String,
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['comments_count'] as int,
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'created_at': instance.createdAt?.toIso8601String(),
      'comments_count': instance.commentsCount,
      'comments': instance.comments?.map((e) => e?.toJson())?.toList(),
      'user': instance.user?.toJson(),
    };
