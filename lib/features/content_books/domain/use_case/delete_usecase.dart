import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/core/usecase/usecase_standard.dart';
import 'package:flutter_application_1/features/content_books/domain/repository/book_content_repository.dart';

class DeleteContentBookUseCase extends UseCaseWithParam<DataState<bool>, int> {
  final BookContentRepository bookContentRepository;

  DeleteContentBookUseCase({required this.bookContentRepository});

  @override
  Future<DataState<bool>> call(int id) {
    return bookContentRepository.deleteContentBookDataById(id);
  }
}
