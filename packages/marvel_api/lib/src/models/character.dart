import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_api/src/models/models.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modifiedAt,
    required this.resourceURI,
    required this.thumbnail,
  });

  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'modified')
  final String modifiedAt;
  @JsonKey(name: 'resourceURI')
  final String resourceURI;
  final Thumbnail thumbnail;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
