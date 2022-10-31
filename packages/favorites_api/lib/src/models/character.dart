import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_repository/src/models/thumbnail.dart';

part 'character.g.dart';

@JsonSerializable()
class Character extends Equatable {
  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modifiedAt,
    required this.resourceURI,
    required this.thumbnail,
    this.isFavorite = false,
  });

  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'modified')
  final String modifiedAt;
  @JsonKey(name: 'resourceURI')
  final String resourceURI;
  final Thumbnail thumbnail;

  final bool isFavorite;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  List<Object?> get props =>
      [id, name, description, modifiedAt, resourceURI, thumbnail, isFavorite];
}
