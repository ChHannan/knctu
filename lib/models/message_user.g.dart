// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageUser _$MessageUserFromJson(Map<String, dynamic> json) {
  return MessageUser(
    json['id'] as String,
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['is_read'] as bool,
  );
}

Map<String, dynamic> _$MessageUserToJson(MessageUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'is_read': instance.isRead,
    };
