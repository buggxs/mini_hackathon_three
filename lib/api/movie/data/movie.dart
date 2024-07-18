import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory Movie({
    @JsonKey(name: 'imdbID') required String id,
    String? title,
    String? year,
    String? released,
    String? runtime,
    String? genre,
    String? boxOffice,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
