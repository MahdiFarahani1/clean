import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';

abstract class DatabaseStatus {}

class DatabaseLoading extends DatabaseStatus {}

class DatabaseComplete extends DatabaseStatus {
  final List<ContentBookEntity> data;
  DatabaseComplete({required this.data});
}

class DatabaseError extends DatabaseStatus {
  final String message;
  DatabaseError({required this.message});
}
