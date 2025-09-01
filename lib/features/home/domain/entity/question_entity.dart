import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/home/data/model/question_model.dart';

class QuestionEntity extends Equatable {
  final List<Question>? questions;

  const QuestionEntity({required this.questions});
  @override
  List<Object?> get props => [];
}
