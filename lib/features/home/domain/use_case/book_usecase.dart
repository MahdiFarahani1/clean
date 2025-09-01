import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/core/usecase/usecase_standard.dart';
import 'package:flutter_application_1/features/home/domain/entity/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/repository/book_repository.dart';

class BookUsecase extends UseCaseWithOutParam<DataState<BookEntity>> {
  final HomeRepository homeRepository;
  BookUsecase(this.homeRepository);
  @override
  Future<DataState<BookEntity>> call() async {
    final result = await homeRepository.fetchBookData();

    if (result is DataSuccess<BookEntity>) {
      final books = result.data!.books;

      books!.sort((a, b) => a.idShow!.compareTo(b.idShow!));

      return DataSuccess(BookEntity(books: books));
    }

    return result;
  }
}
