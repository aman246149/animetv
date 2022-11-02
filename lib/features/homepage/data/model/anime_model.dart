

import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel {
  final String name;
  final String genere;
  final String rating;
  final String seasons;
  final String imageUrl;

  AnimeModel(this.name, this.genere, this.rating, this.seasons,this.imageUrl);

 Map<String, dynamic> toJson() => _$AnimeModelToJson(this);

   factory AnimeModel.fromJson(Map<String, dynamic> json) => _$AnimeModelFromJson(json);

}
