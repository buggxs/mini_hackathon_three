// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailImpl _$$MovieDetailImplFromJson(Map<String, dynamic> json) =>
    _$MovieDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      tagline: json['tagline'] as String?,
      overview: json['overview'] as String?,
      homepage: json['homepage'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['production_companies'] as String?,
      revenue: (json['revenue'] as num?)?.toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
      status: json['status'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MovieDetailImplToJson(_$MovieDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tagline': instance.tagline,
      'overview': instance.overview,
      'homepage': instance.homepage,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'poster_path': instance.posterPath,
      'production_companies': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'vote_average': instance.voteAverage,
    };
