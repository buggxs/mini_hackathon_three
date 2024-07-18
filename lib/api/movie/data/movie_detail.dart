import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';
part 'moviev_detail.g.dart';

@freezed
class MovieDetail with _$MovieDetail {
  factory MovieDetail({
    int? id,
    String? title,
    String? tagline,
    String? overview,
    String? homepage,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies')
    @JsonKey(name: 'release_date')
    String? releaseDate,
    int? revenue,
    int? runtime,
    bool? status,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
}
