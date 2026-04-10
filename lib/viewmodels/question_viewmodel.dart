import 'dart:math';
import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/json_service.dart';

class QuestionViewModel extends ChangeNotifier {
  List<Question> _all = [];
  List<Question> _filtered = [];

  int truthIndex = 0;
  int dareIndex = 0;

  Future<void> init(String lang) async {
    _all = await JsonService.loadQuestions();

    _filtered = _all.where((q) => q.language == lang).toList();

    _filtered.shuffle(Random());

    truthIndex = 0;
    dareIndex = 0;

    notifyListeners();
  }

  String getTruth() {
    final truths = _filtered.where((q) => q.type == "truth").toList();

    if (truthIndex >= truths.length) {
      truths.shuffle();
      truthIndex = 0;
    }

    return truths[truthIndex++].text;
  }

  String getDare() {
    final dares = _filtered.where((q) => q.type == "dare").toList();

    if (dareIndex >= dares.length) {
      dares.shuffle();
      dareIndex = 0;
    }

    return dares[dareIndex++].text;
  }
}
