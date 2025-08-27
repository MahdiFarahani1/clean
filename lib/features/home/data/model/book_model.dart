import 'package:flutter_application_1/features/home/domain/entity/book_entity.dart';

class BookModel extends BookEntity {
  const BookModel({super.books, super.categories, super.lastUpdate});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    var books = <Books>[];
    var categories = <Categories>[];

    if (json['books'] != null) {
      json['books'].forEach((v) {
        books.add(Books.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
    return BookModel(
      books: books,
      categories: categories,
      lastUpdate: json['last_update'],
    );
  }
}

class Books {
  int? id;
  int? part;
  int? categoryId;
  String? title;
  String? img;
  int? dateTime;
  String? writer;
  Null? scholar;
  Null? sound;
  String? pdf;
  Null? epub;
  Null? pdfUrl;
  Null? epubUrl;
  String? updatedAt;
  int? idShow;
  int? bookCode;
  Null? description;
  int? internationalNumber;
  Null? publisher;
  int? changedPages;
  Null? deletedAt;
  String? photoUrl;

  Books({
    this.id,
    this.part,
    this.categoryId,
    this.title,
    this.img,
    this.dateTime,
    this.writer,
    this.scholar,
    this.sound,
    this.pdf,
    this.epub,
    this.pdfUrl,
    this.epubUrl,
    this.updatedAt,
    this.idShow,
    this.bookCode,
    this.description,
    this.internationalNumber,
    this.publisher,
    this.changedPages,
    this.deletedAt,
    this.photoUrl,
  });

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    part = json['part'];
    categoryId = json['category_id'];
    title = json['title'];
    img = json['img'];
    dateTime = json['date_time'];
    writer = json['writer'];
    scholar = json['scholar'];
    sound = json['sound'];
    pdf = json['pdf'];
    epub = json['epub'];
    pdfUrl = json['pdf_url'];
    epubUrl = json['epub_url'];
    updatedAt = json['updated_at'];
    idShow = json['id_show'];
    bookCode = json['book_code'];
    description = json['description'];
    internationalNumber = json['international_number'];
    publisher = json['publisher'];
    changedPages = json['changed_pages'];
    deletedAt = json['deleted_at'];
    photoUrl = json['photo_url'];
  }
}

class Categories {
  int? id;
  String? title;
  int? idShow;
  int? questionCount;

  Categories({this.id, this.title, this.idShow, this.questionCount});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    idShow = json['id_show'];
    questionCount = json['question_count'];
  }
}
