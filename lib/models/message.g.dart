// GENERATED CODE - DO NOT MODIFY BY HAND
/*
part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    json['id'] as String,
    json['text'] as String,
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    (json['message_users'] as List)
        ?.map((e) =>
            e == null ? null : MessageUser.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'user': instance.user?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'message_users': instance.messageUsers?.map((e) => e?.toJson())?.toList(),
    };
*/