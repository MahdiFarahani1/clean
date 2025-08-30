abstract class UseCaseWithParam<T, P> {
  Future<T> call(P param);
}

abstract class UseCaseWithOutParam<T> {
  Future<T> call();
}
