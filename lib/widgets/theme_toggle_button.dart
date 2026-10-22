import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.watch<QuizProvider>();
    final isLight = p.themeMode == ThemeMode.light;

    return IconButton(
      tooltip: isLight ? 'Mode gelap' : 'Mode terang',
      icon: Icon(isLight ? Icons.dark_mode : Icons.light_mode),
      onPressed: p.toggleTheme,
    );
  }
}