import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';

class ContentBookModel extends ContentBookEntity {
  ContentBookModel({
    required super.id,
    required super.page,
    required super.title,
  });

  factory ContentBookModel.fromJson(Map<String, dynamic> json) {
    return ContentBookModel(
      id: json['id'] as int,
      page: json['page'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'page': page, 'title': title};
  }
}
