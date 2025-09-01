part of 'home_bloc.dart';

class HomeState {
  BooksStatus booksStatus;
  QuestionStatus questionStatus;
  HomeState({required this.booksStatus, required this.questionStatus});

  HomeState copyWith({
    BooksStatus? booksStatus,
    QuestionStatus? questionStatus,
  }) {
    return HomeState(
      booksStatus: booksStatus ?? this.booksStatus,
      questionStatus: questionStatus ?? this.questionStatus,
    );
  }
}
