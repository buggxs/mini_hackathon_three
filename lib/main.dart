import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mini_hackathon_three/core/app_service_locator.dart';
import 'package:mini_hackathon_three/screens/start/home_screen.dart';

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
      home: const HomeScreen(),
    );
  }
}
