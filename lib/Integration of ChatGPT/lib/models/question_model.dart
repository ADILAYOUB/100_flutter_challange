class Question {
  String text;

  Question({required this.text});

  Map<String, dynamic> toJson() {
    return {'text': text};
  }
}

class Answer {
  String text;

  Answer({required this.text});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(text: json['text']);
  }
}
