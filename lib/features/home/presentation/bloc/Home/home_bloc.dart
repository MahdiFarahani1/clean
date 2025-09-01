import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/error_handeling/error_handle.dart';
import 'package:flutter_application_1/features/home/domain/entity/question_entity.dart';
import 'package:flutter_application_1/features/home/domain/use_case/book_usecase.dart';
import 'package:flutter_application_1/features/home/domain/use_case/question_usecase.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/Home/books_status.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/Home/question_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BookUsecase bookUsecase;
  final QuestionUsecase questionUsecase;

  HomeBloc({required this.bookUsecase, required this.questionUsecase})
    : super(
        HomeState(
          booksStatus: BooksLoading(),
          questionStatus: QuestionLoading(),
        ),
      ) {
    on<LoadBooksEvent>((event, emit) async {
      emit(state.copyWith(booksStatus: BooksLoading()));

      DataState dataState = await bookUsecase();

      if (dataState is DataSuccess) {
        emit(
          state.copyWith(
            booksStatus: BooksComplete(bookEntity: dataState.data),
          ),
        );
      }
      if (dataState is DataFailed) {
        emit(
          state.copyWith(
            booksStatus: BooksError(error: dataState.message ?? 'is empty'),
          ),
        );
      }
    });

    on<LoadQuestionsEvent>((event, emit) async {
      emit(state.copyWith(questionStatus: QuestionLoading()));

      DataState dataState = await questionUsecase();

      if (dataState is DataSuccess) {
        QuestionEntity questionEntity = dataState.data;

        emit(
          state.copyWith(
            questionStatus: QuestionComplete(questionEntity: questionEntity),
          ),
        );
      }

      if (dataState is DataFailed) {
        emit(
          state.copyWith(
            questionStatus: QuestionError(
              error: dataState.message ?? 'is empty',
            ),
          ),
        );
      }
    });
  }
}
