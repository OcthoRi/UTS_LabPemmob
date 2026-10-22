import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/option_tile.dart';
import '../widgets/page_container.dart';
import '../widgets/primary_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.watch<QuizProvider>();
    final q = p.current;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halo, ${p.playerName}',
          style: TextStyle(
            fontSize: context.sp(0.05),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: PageContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soal ${p.currentIndex + 1} dari ${p.questions.length}',
              style: TextStyle(fontSize: context.sp(0.038)),
            ),
            SizedBox(height: context.sp(0.02)),
            ClipRRect(
              borderRadius: BorderRadius.circular(context.sp(0.02)),
              child: LinearProgressIndicator(
                value: p.progress,
                minHeight: context.sp(0.025),
              ),
            ),
            SizedBox(height: context.sp(0.05)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.sp(0.05)),
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(context.sp(0.04)),
              ),
              child: Text(
                q.text,
                style: TextStyle(
                  fontSize: context.sp(0.047),
                  fontWeight: FontWeight.w600,
                  color: cs.onPrimaryContainer,
                ),
              ),
            ),
            SizedBox(height: context.sp(0.05)),
            for (int i = 0; i < q.options.length; i++)
              OptionTile(
                label: String.fromCharCode(65 + i), // 65 = 'A'
                text: q.options[i],
                isSelected: p.selected == i,
                isCorrect: q.answerIndex == i,
                revealed: p.isAnswered,
                onTap: () => p.select(i),
              ),
            SizedBox(height: context.sp(0.03)),
            PrimaryButton(
              label: p.isLast ? 'Lihat Hasil' : 'Selanjutnya',
              icon: p.isLast ? Icons.emoji_events : Icons.arrow_forward,
              
              onPressed: !p.isAnswered
                  ? null
                  : () {
                      if (p.isLast) {
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Kuis Selesai!'),
                          ),
                        );
                      } else {
                        p.next();
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}