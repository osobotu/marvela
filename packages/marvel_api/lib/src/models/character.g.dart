// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Character',
      json,
      ($checkedConvert) {
        final val = Character(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          modifiedAt: $checkedConvert('modified', (v) => v as String),
          resourceURI: $checkedConvert('resourceURI', (v) => v as String),
          thumbnail: $checkedConvert('thumbnail',
              (v) => Thumbnail.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'modifiedAt': 'modified'},
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'modified': instance.modifiedAt,
      'resourceURI': instance.resourceURI,
      'thumbnail': instance.thumbnail.toJson(),
    };
