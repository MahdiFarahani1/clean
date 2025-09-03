import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/core/usecase/usecase_standard.dart';
import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';
import 'package:flutter_application_1/features/content_books/domain/repository/book_content_repository.dart';

class AddBookContentUsecase
    extends UseCaseWithParam<DataState<bool>, ContentBookEntity> {
  final BookContentRepository bookContentRepository;

  AddBookContentUsecase({required this.bookContentRepository});

  @override
  Future<DataState<bool>> call(ContentBookEntity entity) {
    return bookContentRepository.insertContentBookData(entity);
  }
}
