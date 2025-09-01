import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/features/home/data/data_source/remote/api_book_provider.dart';
import 'package:flutter_application_1/features/home/data/model/book_model.dart';
import 'package:flutter_application_1/features/home/data/model/question_model.dart';
import 'package:flutter_application_1/features/home/domain/entity/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/entity/question_entity.dart';
import 'package:flutter_application_1/features/home/domain/repository/book_repository.dart';

class BookRepositoryImpl implements HomeRepository {
  final ApiBookProvider apiHomeProvider;

  BookRepositoryImpl(this.apiHomeProvider);
  @override
  Future<DataState<BookEntity>> fetchBookData() async {
    try {
      final response = await apiHomeProvider.callBooks();

      if (response.statusCode == 200) {
        final BookEntity bookEntity = BookModel.fromJson(response.data);

        return DataSuccess(bookEntity);
      } else {
        return DataFailed('Your Connection Has Problem...');
      }
    } catch (e) {
      return DataFailed('Caching Error:$e');
    }
  }

  @override
  Future<DataState<QuestionEntity>> fetchQuestionData() async {
    try {
      final response = await apiHomeProvider.callQuestion();

      if (response.statusCode == 200) {
        final QuestionEntity questionEntity = QuestionsModel.fromJson(
          response.data,
        );

        return DataSuccess(questionEntity);
      } else {
        return DataFailed('Your Connection Has Problem...');
      }
    } catch (e) {
      return DataFailed('Caching Error:$e');
    }
  }
}
