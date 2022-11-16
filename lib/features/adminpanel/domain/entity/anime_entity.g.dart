// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeEntity _$AnimeEntityFromJson(Map<String, dynamic> json) => AnimeEntity(
      json['name'] as String?,
      json['genere'] as String?,
      json['rating'] as String?,
      json['seasons'] as String?,
      json['imageUrl'] as String?,
      json['time'] as String,
    );

Map<String, dynamic> _$AnimeEntityToJson(AnimeEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'genere': instance.genere,
      'rating': instance.rating,
      'seasons': instance.seasons,
      'imageUrl': instance.imageUrl,
      'time': instance.time,
    };
