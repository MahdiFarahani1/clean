part of 'database_bloc.dart';

@immutable
sealed class DatabaseEvent {}

class LoadContentBooks extends DatabaseEvent {}

class DeleteContentBook extends DatabaseEvent {
  final int id;
  DeleteContentBook({required this.id});
}

class AddContentBook extends DatabaseEvent {
  final ContentBookEntity entity;
  AddContentBook({required this.entity});
}
