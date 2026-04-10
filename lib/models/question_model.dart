import 'package:hive/hive.dart';

part 'question_model.g.dart';

@HiveType(typeId: 0)
class Question {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final String type;

  Question({required this.text, required this.type});
}
