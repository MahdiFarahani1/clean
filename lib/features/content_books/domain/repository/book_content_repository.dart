import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';

abstract class BookContentRepository {
  Future<DataState<List<ContentBookEntity>>> fetchContentBookData();

  Future<DataState<bool>> deleteContentBookDataById(int id);
  Future<DataState<bool>> insertContentBookData(
    ContentBookEntity contentBookEntity,
  );
}
