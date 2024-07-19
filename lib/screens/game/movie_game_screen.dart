import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail_page.dart';
import 'package:mini_hackathon_three/misc/logger.dart';
import 'package:mini_hackathon_three/screens/game/cubit/game_cubit.dart';
import 'package:mini_hackathon_three/screens/game/widgets/movie_game_content.dart';

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
      body: BlocProvider(
        create: (context) => GameCubit(),
        child: const MovieGamesContent(),
      ),
      // body: movieTest == null
      //     ? const CircularProgressIndicator()
      //     : ListView.builder(
      //         itemCount: movieTest!.length,
      //         itemBuilder: (context, index) {
      //           return Column(
      //             children: [
      //               ...movieTest![index].movieList!.map((e) => Text(e.title!)),
      //               const Divider(),
      //             ],
      //           );
      //         },
      //       ),
    );
  }

  // @override
  // void initState() {
  //   loadMovie();
  //   super.initState();
  // }

  // void loadMovie() async {
  //   List<MovieDetailPage> loadedMovie =
  //       await app<MovieService>().getPopularMovies(pages: 10);
  //   setState(() {
  //     movieTest = loadedMovie;
  //   });
  // }
}
