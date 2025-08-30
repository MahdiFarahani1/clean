import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/features/home/data/data_source/remote/api_book_provider.dart';
import 'package:flutter_application_1/features/home/data/model/book_model.dart';
import 'package:flutter_application_1/features/home/domain/entity/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final ApiBookProvider _apiBookProvider = ApiBookProvider();
  @override
  Future<DataState<BookEntity>> fetchBookData() async {
    try {
      final response = await _apiBookProvider.callBooks();

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
}
