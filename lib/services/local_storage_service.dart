import 'package:hive/hive.dart';
import '../models/question_model.dart';

class LocalStorageService {
  static const String boxName = "questionsBox";

  Box<Question> get _box => Hive.box<Question>(boxName);

  List<Question> getAllQuestions() {
    return _box.values.toList();
  }

  void addQuestion(Question question) {
    _box.add(question);
  }
}
