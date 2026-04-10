import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/question_model.dart';

class JsonService {
  static Future<List<Question>> loadQuestions() async {
    final data = await rootBundle.loadString('assets/questions.json');
    final decoded = json.decode(data);

    return (decoded['questions'] as List)
        .map((q) => Question.fromJson(q))
        .toList();
  }
}
