// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'thumbnail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Thumbnail',
      json,
      ($checkedConvert) {
        final val = Thumbnail(
          path: $checkedConvert('path', (v) => v as String),
          extension: $checkedConvert('extension', (v) => v as String),
        );
        return val;
      },
    );
