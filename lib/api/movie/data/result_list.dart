import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_hackathon_three/api/movie/data/movie.dart';

part 'result_list.freezed.dart';
part 'result_list.g.dart';

@freezed
class ResultList with _$ResultList {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory ResultList({
    required List<Movie> search,
  }) = _Movie;

  factory ResultList.fromJson(Map<String, Object?> json) =>
      _$ResultListFromJson(json);
}
