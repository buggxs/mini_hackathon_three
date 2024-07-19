import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail_page.dart';
import 'package:mini_hackathon_three/api/movie/movie_service.dart';
import 'package:mini_hackathon_three/core/app_service_locator.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState(movieList: [], page: 1)) {
    loadMovies();
  }

  void loadData() {
    loadMovies();
  }

  void loadMovies() async {
    List<MovieDetailPage> loadedMovie =
        await app<MovieService>().getPopularMovies(pages: state.page);
    final qoute = await getQuoteMovie(loadedMovie[0].movieList![0].title!);
    emit(state.copyWith(movieList: loadedMovie, quote: qoute));
  }

  Future<String> getQuoteMovie(String title) async {
    return await app<MovieService>().getQuoteFromMovie(title);
  }
}
