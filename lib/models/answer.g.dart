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
    json['hasUpvoted'] as bool ?? false,
    json['upvote_count'] as int,
    json['view_count'] as int,
  )..infoUser = json['info_user'] == null
      ? null
      : InfoUser.fromJson(json['info_user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'hasUpvoted': instance.hasUpvoted,
      'created_at': instance.createdAt?.toIso8601String(),
      'comments_count': instance.commentsCount,
      'upvote_count': instance.upvoteCount,
      'view_count': instance.viewCount,
      'info_user': instance.infoUser?.toJson(),
      'comments': instance.comments?.map((e) => e?.toJson())?.toList(),
      'user': instance.user?.toJson(),
    };
