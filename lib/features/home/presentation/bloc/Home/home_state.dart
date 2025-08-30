part of 'home_bloc.dart';

class HomeState {
  BooksStatus booksStatus;
  HomeState({required this.booksStatus});

  HomeState copyWith({BooksStatus? booksStatus}) {
    return HomeState(booksStatus: booksStatus ?? this.booksStatus);
  }
}
