import 'package:flutter_application_1/features/home/domain/entity/book_entity.dart';

abstract class BooksStatus {}

class BooksLoading extends BooksStatus {}

class BooksComplete extends BooksStatus {
  BookEntity bookEntity;

  BooksComplete({required this.bookEntity});
}

class BooksError extends BooksStatus {
  String error;

  BooksError({required this.error});
}
