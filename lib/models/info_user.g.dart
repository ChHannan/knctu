// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUser _$InfoUserFromJson(Map<String, dynamic> json) {
  return InfoUser(
    json['id'] as String,
    json['name'] as String,
    json['has_upvoted'] as bool,
    json['has_viewed'] as bool,
    json['has_shared'] as bool,
  );
}

Map<String, dynamic> _$InfoUserToJson(InfoUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'has_upvoted': instance.hasUpvoted,
      'has_viewed': instance.hasViewed,
      'has_shared': instance.hasShared,
    };
