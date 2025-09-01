import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/features/home/domain/entity/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/entity/question_entity.dart';

abstract class HomeRepository {
  Future<DataState<BookEntity>> fetchBookData();

  Future<DataState<QuestionEntity>> fetchQuestionData();
}
