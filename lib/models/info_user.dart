import 'package:json_annotation/json_annotation.dart';

part 'info_user.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoUser {
  String id;
  String name;

  @JsonKey(name: 'has_upvoted')
  bool hasUpvoted;

  @JsonKey(name: 'has_viewed')
  bool hasViewed;

  @JsonKey(name: 'has_shared')
  bool hasShared;

  InfoUser(this.id, this.name, this.hasUpvoted, this.hasViewed, this.hasShared);

  factory InfoUser.fromJson(Map<String, dynamic> json) => _$InfoUserFromJson(json);

  Map<String, dynamic> toJson() => _$InfoUserToJson(this);
}
