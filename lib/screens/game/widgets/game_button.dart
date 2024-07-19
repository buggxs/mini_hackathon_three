import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    this.title,
    required this.onPress,
  });

  final String? title;
  final ValueChanged<String> onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPress(title ?? 'Fehler'),
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.grey),
      ),
      child: Center(
        child: Text(
          title ?? 'Überprüfen',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
