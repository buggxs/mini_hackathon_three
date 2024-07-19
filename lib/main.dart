import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mini_hackathon_three/api/movie/chat_gpt_service.dart';
import 'package:mini_hackathon_three/api/movie/data/movie.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail_page.dart';
import 'package:mini_hackathon_three/api/movie/movie_service.dart';
import 'package:mini_hackathon_three/core/app_service_locator.dart';
import 'package:mini_hackathon_three/misc/logger.dart';

void main() async {
  setup();
  await dotenv.load(fileName: '.env');
  runApp(const MovieGame());
}

class MovieGame extends StatelessWidget {
  const MovieGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MovieGameScreen(title: 'Flutter Movie Game'),
    );
  }
}

class MovieGameScreen extends StatefulWidget {
  const MovieGameScreen({super.key, required this.title});

  final String title;

  @override
  State<MovieGameScreen> createState() => _MovieGameScreenState();
}

class _MovieGameScreenState extends State<MovieGameScreen> with LoggerMixin {
  Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: movie == null
          ? const CircularProgressIndicator()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    movie?.toString() ?? '',
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void initState() {
    loadMovie();
    super.initState();
  }

  void loadMovie() async {
    MovieDetailPage moviePage = await app<MovieService>().fetchPopularMovies();
    if (moviePage.movieList?.isEmpty ?? true) {
      return;
    }

    MovieDetail movie = moviePage.movieList!.first;

    String quote =
        await app<MovieGptService>().getQuoteFromMovie(movie.title ?? '');
    log.info(quote);
  }
}
