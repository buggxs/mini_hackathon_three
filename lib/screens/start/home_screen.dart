import 'package:flutter/material.dart';
import 'package:mini_hackathon_three/screens/game/movie_game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Movie Game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MovieGameScreen(title: 'Game'),
                ),
              ),
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
