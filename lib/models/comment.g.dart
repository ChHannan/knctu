// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['id'] as String,
    json['text'] as String,
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    (json['replies'] as List)
        ?.map(
            (e) => e == null ? null : Reply.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'created_at': instance.createdAt?.toIso8601String(),
      'replies': instance.replies?.map((e) => e?.toJson())?.toList(),
      'user': instance.user?.toJson(),
    };
