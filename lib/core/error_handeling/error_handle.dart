abstract class DataState<T> {
  final T? data;
  final String? message;

  const DataState(this.data, this.message);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T? data) : super(data, null);
}

class DataFailed<T> extends DataState {
  const DataFailed(String? message) : super(null, message);
}
