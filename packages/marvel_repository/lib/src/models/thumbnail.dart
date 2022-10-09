import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thumbnail.g.dart';

@JsonSerializable()
class Thumbnail extends Equatable {
  Thumbnail({required this.path, required this.extension});
  final String path;
  final String extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  @override
  List<Object?> get props => [path, extension];
}
