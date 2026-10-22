import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/page_container.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.watch<QuizProvider>();
    final cs = Theme.of(context).colorScheme;
    final lulus = p.percent >= 70;

    return Scaffold(
      body: PageContainer(
        child: Column(
          children: [
            Icon(
              lulus ? Icons.emoji_events : Icons.sentiment_neutral,
              size: context.sp(0.35),
              color: lulus ? Colors.amber : cs.primary,
            ),
            SizedBox(height: context.sp(0.04)),
            Text(
              lulus
                  ? 'Kerja bagus, ${p.playerName}!'
                  : 'Tetap semangat, ${p.playerName}!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.sp(0.06),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: context.sp(0.04)),
            Text(
              '${p.score} / ${p.questions.length}',
              style: TextStyle(
                fontSize: context.sp(0.16),
                fontWeight: FontWeight.w700,
                color: cs.primary,
              ),
            ),
            Text(
              'Skor akhir: ${p.percent}%',
              style: TextStyle(fontSize: context.sp(0.045)),
            ),
            SizedBox(height: context.sp(0.08)),
            PrimaryButton(
              label: 'Ulangi Kuis',
              icon: Icons.replay,
              onPressed: () {
                p.restart();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },
            ),
            SizedBox(height: context.sp(0.03)),
            PrimaryButton(
              label: 'Kembali ke Beranda',
              icon: Icons.home,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}