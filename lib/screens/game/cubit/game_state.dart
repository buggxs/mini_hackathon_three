part of 'game_cubit.dart';

class GameState {
  GameState({
    required this.movieList,
    required this.page,
    this.title,
    this.quote,
    this.error = false,
    this.answerResult = AnswerResult.nothing,
  });
  final List<MovieDetailPage> movieList;
  final int page;
  final String? title;
  final String? quote;
  final bool error;
  final AnswerResult answerResult;

  GameState copyWith({
    List<MovieDetailPage>? movieList,
    int? page,
    String? title,
    String? quote,
    bool? error,
    AnswerResult? answerResult,
  }) {
    return GameState(
      movieList: movieList ?? this.movieList,
      page: page ?? this.page,
      title: title ?? this.title,
      quote: quote ?? this.quote,
      error: error ?? this.error,
      answerResult: answerResult ?? this.answerResult,
    );
  }

  List<String> getRandomTitles() {
    List<String> titles = [title!];
    for (int i = 0; titles.length <= 3; i++) {
      int randomPicker =
          Random().nextInt(movieList.first.movieList?.length ?? 0);
      String randomTitle = movieList.first.movieList
              ?.map((e) => e.title)
              .toList()[randomPicker] ??
          '';
      titles = [
        ...titles,
        if (!titles.contains(randomTitle)) randomTitle,
      ];
    }
    return titles;
  }

  String getNextMovieTitle(int movieIndex) {
    return movieList.first.movieList?[movieIndex].title ?? '';
  }

  int get amountOfMovies => movieList.first.movieList?.length ?? 0;

  int get movieIndex =>
      (movieList.first.movieList
              ?.indexWhere((MovieDetail md) => md.title == title) ??
          0) +
      1;
}

enum AnswerResult {
  nothing,
  wrong,
  right,
}
