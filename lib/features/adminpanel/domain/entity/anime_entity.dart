
import 'package:json_annotation/json_annotation.dart';

part 'anime_entity.g.dart';

@JsonSerializable()
class AnimeEntity {
  final String? name;
  final String? genere;
  final String? rating;
  final String? seasons;
  final String? imageUrl;
  final String time ;

  AnimeEntity(
    
    this.name,
    this.genere,
    this.rating,
    this.seasons,
    this.imageUrl,
    this.time
  );

  Map<String, dynamic> toJson() => _$AnimeEntityToJson(this);

  factory AnimeEntity.fromJson(Map<String, dynamic> json) =>
      _$AnimeEntityFromJson(json);
}
