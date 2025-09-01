import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/core/usecase/usecase_standard.dart';
import 'package:flutter_application_1/features/home/domain/entity/question_entity.dart';
import 'package:flutter_application_1/features/home/domain/repository/book_repository.dart';

class QuestionUsecase extends UseCaseWithOutParam<DataState<QuestionEntity>> {
  final HomeRepository homeRepository;

  QuestionUsecase({required this.homeRepository});

  @override
  Future<DataState<QuestionEntity>> call() async {
    final result = await homeRepository.fetchQuestionData();

    return result;
  }
}
