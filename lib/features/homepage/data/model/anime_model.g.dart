// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
      json['name'] as String,
      json['genere'] as String,
      json['rating'] as String,
      json['seasons'] as String,
      json['imageUrl'] as String,
    );

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'genere': instance.genere,
      'rating': instance.rating,
      'seasons': instance.seasons,
      'imageUrl': instance.imageUrl,
    };
