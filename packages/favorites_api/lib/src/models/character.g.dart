// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteCharacter _$FavoriteCharacterFromJson(Map<String, dynamic> json) =>
    FavoriteCharacter(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      resourceURI: json['resourceURI'] as String,
      thumbnail:
          FavoriteThumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$FavoriteCharacterToJson(FavoriteCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'resourceURI': instance.resourceURI,
      'thumbnail': instance.thumbnail,
      'isFavorite': instance.isFavorite,
    };
