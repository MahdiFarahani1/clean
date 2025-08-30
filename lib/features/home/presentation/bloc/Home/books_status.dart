import 'package:flutter_application_1/features/home/domain/use_case/book_usecase.dart';

abstract class BooksStatus {}

class BooksLoading extends BooksStatus {}

class BooksComplete extends BooksStatus {
  BookUsecase bookUsecase;

  BooksComplete({required this.bookUsecase});
}

class BooksError extends BooksStatus {
  String error;

  BooksError({required this.error});
}
