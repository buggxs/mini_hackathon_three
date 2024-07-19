import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  List<MovieDetailPage>? movieTest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: movieTest == null
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: movieTest!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ...movieTest![index].movieList!.map((e) => Text(e.title!)),
                    const Divider(),
                  ],
                );
              },
            ),
    );
  }

  @override
  void initState() {
    loadMovie();
    super.initState();
  }

  void loadMovie() async {
    List<MovieDetailPage> loadedMovie =
        await app<MovieService>().getPopularMovies(pages: 10);
    setState(() {
      movieTest = loadedMovie;
    });
  }
}
