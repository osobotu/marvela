import 'package:equatable/equatable.dart';
import 'package:favorites_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class FavoriteCharacter extends Equatable {
  const FavoriteCharacter({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.resourceURI,
    required this.thumbnail,
    this.isFavorite = false,
  });

  final int id;
  final String name;
  final String description;

  final String createdAt;
  @JsonKey(name: 'resourceURI')
  final String resourceURI;
  final FavoriteThumbnail thumbnail;

  final bool isFavorite;

  factory FavoriteCharacter.fromJson(Map<String, dynamic> json) =>
      _$FavoriteCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteCharacterToJson(this);

  @override
  List<Object?> get props =>
      [id, name, description, createdAt, resourceURI, thumbnail, isFavorite];
}
