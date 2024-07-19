import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_hackathon_three/screens/game/cubit/game_cubit.dart';
import 'package:mini_hackathon_three/screens/game/widgets/game_button.dart';

class MovieGamesContent extends StatelessWidget {
  const MovieGamesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GameCubit gameCubit = context.watch<GameCubit>();

    Widget child = gameCubit.state.quote == null
        ? const Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Zitat (${gameCubit.state.movieIndex}/${gameCubit.state.amountOfMovies})',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(gameCubit.state.quote!),
              Column(
                children: [
                  ...gameCubit.state.getRandomTitles().map(
                        (title) => GameButton(
                          title: title,
                          onPress: gameCubit.sendAnswer,
                        ),
                      ),
                ],
              ),
            ],
          );

    if (gameCubit.state.error) {
      child = const Center(
        child: Text('Es gab einen Fehler. Versuch es später erneut.'),
      );
    }

    return child;
  }
}
