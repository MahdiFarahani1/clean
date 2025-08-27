import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/home/data/model/book_model.dart';

class BookEntity extends Equatable {
  final List<Books>? books;
  final List<Categories>? categories;
  final String? lastUpdate;

  const BookEntity({this.books, this.categories, this.lastUpdate});
  @override
  List<Object?> get props => [];
}
