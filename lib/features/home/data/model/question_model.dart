import 'package:flutter_application_1/features/home/domain/entity/question_entity.dart';

class QuestionsModel extends QuestionEntity {
  const QuestionsModel({super.questions});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e))
          .toList(),
    );
  }
}

class Question {
  final int id;
  final int categotyId;
  final String title;
  final String content;
  final String answer;

  Question({
    required this.id,
    required this.categotyId,
    required this.title,
    required this.content,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      categotyId: json['category_id'],
      title: json['title'],
      content: json['content'],
      answer: json['answer'],
    );
  }
}
