class Question {
  final String text;
  final String type;
  final String language;

  Question({required this.text, required this.type, required this.language});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      text: json['text'],
      type: json['type'],
      language: json['language'],
    );
  }
}
