import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/features/home/domain/use_case/book_usecase.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/Home/books_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final usecase = BookUsecase();

  HomeBloc() : super(HomeState(booksStatus: BooksLoading())) {
    on<LoadBooksEvent>((event, emit) async {
      emit(state.copyWith(booksStatus: BooksLoading()));

      DataState dateState = await usecase();

      if (dateState is DataSuccess) {
        emit(
          state.copyWith(
            booksStatus: BooksComplete(bookUsecase: dateState.data),
          ),
        );
      }
      if (dateState is DataFailed) {
        emit(
          state.copyWith(
            booksStatus: BooksError(error: dateState.message ?? 'is empty'),
          ),
        );
      }
    });
  }
}
