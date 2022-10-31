import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thumbnail.g.dart';

@JsonSerializable()
class FavoriteThumbnail extends Equatable {
  FavoriteThumbnail({required this.path, required this.extension});
  final String path;
  final String extension;

  factory FavoriteThumbnail.fromJson(Map<String, dynamic> json) =>
      _$FavoriteThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteThumbnailToJson(this);
  @override
  List<Object?> get props => [path, extension];
}
