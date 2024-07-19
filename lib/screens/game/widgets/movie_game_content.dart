import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_hackathon_three/screens/game/cubit/game_cubit.dart';
import 'package:mini_hackathon_three/screens/game/widgets/game_button.dart';

class MovieGamesContent extends StatelessWidget {
  const MovieGamesContent({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final GameCubit gameCubit = context.watch<GameCubit>();
    return gameCubit.state.quote == null
        ? const Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(gameCubit.state.quote!),
              const TextField(),
              GameButton(size: size),
            ],
          );
  }
}
