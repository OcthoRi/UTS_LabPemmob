import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';


void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => QuizProvider(),
        child: const KuisApp(),
      ),
    );

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Pintar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: context.watch<QuizProvider>().themeMode,
      home: const HomeScreen(),
    );
  }
}