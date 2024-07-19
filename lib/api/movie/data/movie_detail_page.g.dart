// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailPage _$MovieDetailPageFromJson(Map<String, dynamic> json) =>
    MovieDetailPage(
      movieList: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieDetailPageToJson(MovieDetailPage instance) =>
    <String, dynamic>{
      'results': instance.movieList,
      'page': instance.page,
      'total_pages': instance.totalPages,
    };
