import 'package:json_annotation/json_annotation.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail.dart';

part 'movie_detail_page.g.dart';

@JsonSerializable()
class MovieDetailPage {
  MovieDetailPage({
    this.movieList,
    this.page,
    this.totalPages,
  });
  @JsonKey(name: 'results')
  List<MovieDetail>? movieList;
  int? page;
  @JsonKey(name: 'total_pages')
  int? totalPages;

  factory MovieDetailPage.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailPageFromJson(json);
}
