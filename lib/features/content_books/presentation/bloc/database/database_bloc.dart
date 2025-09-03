import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';
import 'package:flutter_application_1/features/content_books/domain/use_case/add_usecase.dart';
import 'package:flutter_application_1/features/content_books/domain/use_case/delete_usecase.dart';
import 'package:flutter_application_1/features/content_books/domain/use_case/get_content_books_usecase.dart';
import 'package:flutter_application_1/features/content_books/presentation/bloc/database/database_status.dart';
import 'package:meta/meta.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final GetContentBooksUsecase getContentBooksUsecase;
  final DeleteContentBookUseCase deleteContentBookUseCase;
  final AddBookContentUsecase addBookContentUsecase;

  DatabaseBloc({
    required this.getContentBooksUsecase,
    required this.deleteContentBookUseCase,
    required this.addBookContentUsecase,
  }) : super(DatabaseState(databaseStatus: DatabaseLoading())) {
    on<LoadContentBooks>((event, emit) async {
      try {
        print('started');
        emit(state.copyWith(databaseStatus: DatabaseLoading()));
        DataState dataState = await getContentBooksUsecase();
        if (dataState is DataSuccess) {
          print('DataSuccess');

          emit(
            state.copyWith(
              databaseStatus: DatabaseComplete(data: dataState.data),
            ),
          );
        }
        if (dataState is DataFailed) {
          print('DataFailed');

          emit(
            state.copyWith(
              databaseStatus: DatabaseError(message: 'error2!!!!!!!!!!!'),
            ),
          );
        }
      } catch (e) {
        print('DataFailed2');
        emit(
          state.copyWith(
            databaseStatus: DatabaseError(message: 'error!!!!!!!!!!!'),
          ),
        );
      }
    });
    on<DeleteContentBook>((event, emit) async {
      deleteContentBookUseCase(event.id);

      add(LoadContentBooks());
    });
    on<AddContentBook>((event, emit) {
      addBookContentUsecase(event.entity);
      add(LoadContentBooks());
    });
  }
}
