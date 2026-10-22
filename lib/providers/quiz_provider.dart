import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../models/question.dart';

/// State management: progres kuis disimpan di sini, bukan di widget,
/// sehingga tidak hilang saat layar dirotasi atau berpindah halaman.
class QuizProvider extends ChangeNotifier {
  final List<Question> questions = quizQuestions;

  String playerName = '';
  int currentIndex = 0;
  late List<int?> answers = List.filled(questions.length, null);
  ThemeMode themeMode = ThemeMode.light;

  Question get current => questions[currentIndex];
  int? get selected => answers[currentIndex];
  bool get isAnswered => selected != null;
  bool get isLast => currentIndex == questions.length - 1;
  double get progress => (currentIndex + 1) / questions.length;

  int get score {
    int total = 0;
    for (int i = 0; i < questions.length; i++) {
      if (answers[i] == questions[i].answerIndex) total++;
    }
    return total;
  }

  int get percent => (score * 100 / questions.length).round();

  /// Dipanggil saat tombol "Mulai Kuis" ditekan.
  void start(String name) {
    playerName = name.trim();
    _reset();
    notifyListeners();
  }

  /// Memilih jawaban; terkunci setelah dipilih.
  void select(int index) {
    if (isAnswered) return;
    answers[currentIndex] = index;
    notifyListeners();
  }

  void next() {
    if (!isLast && isAnswered) {
      currentIndex++;
      notifyListeners();
    }
  }

  void restart() {
    _reset();
    notifyListeners();
  }

  void toggleTheme() {
    themeMode =
        themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void _reset() {
    currentIndex = 0;
    answers = List.filled(questions.length, null);
  }
}