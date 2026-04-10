import 'dart:math';
import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/local_storage_service.dart';

class QuestionViewModel extends ChangeNotifier {
  final LocalStorageService _storage = LocalStorageService();
  final Random _random = Random();

  List<Question> questions = [];
  Question? currentQuestion;
  String currentType = "truth";

  void init() {
    loadQuestions();
  }

  void loadQuestions() {
    questions = _storage.getAllQuestions();

    // Add default data if empty
    if (questions.isEmpty) {
      questions = [
        Question(text: "What is your biggest fear?", type: "truth"),
        Question(text: "Dance for 30 seconds", type: "dare"),
        Question(text: "What is your biggest fear?", type: "truth"),
        Question(text: "slap me", type: "dare"),
        Question(text: "What is your favorite color?", type: "truth"),
        Question(text: "kiss me", type: "dare"),
        Question(text: "What is your biggest fear?", type: "truth"),
        Question(text: "hug me", type: "dare"),
      ];
    }

    notifyListeners();
  }

  void startGame(String type) {
    currentType = type;
    nextQuestion();
  }

  void nextQuestion() {
    final filtered = questions.where((q) => q.type == currentType).toList();

    if (filtered.isEmpty) return;

    currentQuestion = filtered[_random.nextInt(filtered.length)];

    notifyListeners();
  }

  void addQuestion(String text, String type) {
    final q = Question(text: text, type: type);
    _storage.addQuestion(q);
    loadQuestions();
  }
}
