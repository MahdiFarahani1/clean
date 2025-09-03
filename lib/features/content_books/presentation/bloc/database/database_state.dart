part of 'database_bloc.dart';

class DatabaseState {
  DatabaseStatus databaseStatus;

  DatabaseState({required this.databaseStatus});

  DatabaseState copyWith({DatabaseStatus? databaseStatus}) {
    return DatabaseState(databaseStatus: databaseStatus ?? this.databaseStatus);
  }
}
