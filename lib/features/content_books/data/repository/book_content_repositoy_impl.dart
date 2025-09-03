import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/features/content_books/data/data_source/local/content_book_dbhelper.dart';
import 'package:flutter_application_1/features/content_books/data/model/content_book_model.dart';
import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';
import 'package:flutter_application_1/features/content_books/domain/repository/book_content_repository.dart';

class BookContentRepositoryImpl implements BookContentRepository {
  @override
  Future<DataState<List<ContentBookEntity>>> fetchContentBookData() async {
    try {
      final db = await BookContentDatabaseHelper.database;

      final data = await db.query('bgroups');
      final contentBooks = data
          .map((e) => ContentBookModel.fromJson(e))
          .toList();
      return DataSuccess(contentBooks);
    } catch (e) {
      print('Error: $e');
      return DataFailed('we has error');
    }
  }

  @override
  Future<DataState<bool>> deleteContentBookDataById(int id) async {
    try {
      final db = await BookContentDatabaseHelper.database;
      final count = await db.delete(
        'bgroups',
        where: 'id = ?',
        whereArgs: [id],
      );

      return DataSuccess(count > 0);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed('we has error');
    }
  }

  @override
  Future<DataState<bool>> insertContentBookData(
    ContentBookEntity contentBookEntity,
  ) async {
    try {
      final db = await BookContentDatabaseHelper.database;

      final data = await db.insert('bgroups', {
        'title': contentBookEntity.title,
        'page': contentBookEntity.page,
      });
      return DataSuccess(data > 0);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed('we has error');
    }
  }
}
