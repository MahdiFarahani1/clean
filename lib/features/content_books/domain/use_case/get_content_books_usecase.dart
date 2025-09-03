import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/core/usecase/usecase_standard.dart';
import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';
import 'package:flutter_application_1/features/content_books/domain/repository/book_content_repository.dart';

class GetContentBooksUsecase
    extends UseCaseWithOutParam<DataState<List<ContentBookEntity>>> {
  final BookContentRepository bookContentRepository;

  GetContentBooksUsecase({required this.bookContentRepository});

  @override
  Future<DataState<List<ContentBookEntity>>> call() async {
    final booksContent = await bookContentRepository.fetchContentBookData();

    if (booksContent is DataSuccess) {
      return DataSuccess(booksContent.data);
    }

    return DataFailed('error!!!');
  }
}
