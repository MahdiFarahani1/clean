import 'package:flutter_application_1/features/home/domain/entity/question_entity.dart';

abstract class QuestionStatus {}

class QuestionLoading extends QuestionStatus {}

class QuestionComplete extends QuestionStatus {
  QuestionEntity questionEntity;

  QuestionComplete({required this.questionEntity});
}

class QuestionError extends QuestionStatus {
  String error;

  QuestionError({required this.error});
}
