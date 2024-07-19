part of 'game_cubit.dart';

class GameState {
  GameState({
    required this.movieList,
    required this.page,
    this.title,
    this.quote,
  });
  final List<MovieDetailPage> movieList;
  final int page;
  final String? title;
  final String? quote;

  GameState copyWith({
    List<MovieDetailPage>? movieList,
    int? page,
    String? title,
    String? quote,
  }) {
    return GameState(
      movieList: movieList ?? this.movieList,
      page: page ?? this.page,
      title: title ?? this.title,
      quote: quote ?? this.quote,
    );
  }
}
