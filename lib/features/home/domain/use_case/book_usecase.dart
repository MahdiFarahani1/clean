import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/core/usecase/usecase_standard.dart';
import 'package:flutter_application_1/features/home/data/repository/book_repository_impl.dart';
import 'package:flutter_application_1/features/home/domain/entity/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/repository/book_repository.dart';

class BookUsecase extends UseCaseWithOutParam<DataState<BookEntity>> {
  final BookRepository bookRepository = BookRepositoryImpl();

  @override
  Future<DataState<BookEntity>> call() async {
    final resualt = await bookRepository.fetchBookData();
    return resualt;
  }
}
