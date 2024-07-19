import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail_page.dart';
import 'package:mini_hackathon_three/api/movie/movie_service.dart';
import 'package:mini_hackathon_three/core/app_service_locator.dart';
import 'package:mini_hackathon_three/misc/logger.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> with LoggerMixin {
  GameCubit() : super(GameState(movieList: [], page: 1)) {
    loadMovies();
  }

  void loadData() {
    loadMovies();
  }

  void loadMovies() async {
    List<MovieDetailPage> loadedMovie =
        await app<MovieService>().getPopularMovies(pages: state.page);
    String firstTitle = loadedMovie[0].movieList![0].title!;
    final String? quote = await getGeminiQuote(firstTitle);
    if (quote == null) {
      emit(state.copyWith(error: true));
      return;
    }
    emit(state.copyWith(
      movieList: loadedMovie,
      title: firstTitle,
      quote: quote,
    ));
  }

  Future<String> getQuoteMovie(String title) async {
    return await app<MovieService>().getQuoteFromMovie(title);
  }

  Future<String?> getGeminiQuote(String title) async {
    try {
      return await app<MovieService>().geminiQuotes(title) ?? '';
    } catch (e, st) {
      logger.severe(e, st);
    }
    return null;
  }

  void sendAnswer(String title) {
    if (title == state.title) {
      logger.info('Richtige Antwort! :)');
      processCorrectAnswer();
    } else {
      logger.severe('Falsche Antwort! :)');
    }
  }

  void processWrongAnswer() async {
    emit(state.copyWith(answerResult: AnswerResult.wrong));
    Future.delayed(const Duration(seconds: 3)).then((_) {
      emit(state.copyWith(answerResult: AnswerResult.nothing));
    });
  }

  void processCorrectAnswer() async {
    emit(state.copyWith(answerResult: AnswerResult.right));
    int movieIndex = state.movieIndex;
    String nextTitle = state.getNextMovieTitle(movieIndex);
    String? nextQuote = await getGeminiQuote(nextTitle);
    if (nextQuote == null) {
      emit(state.copyWith(error: true));
      return;
    }
    emit(state.copyWith(
      title: nextTitle,
      quote: nextQuote,
      answerResult: AnswerResult.nothing,
    ));
  }
}
