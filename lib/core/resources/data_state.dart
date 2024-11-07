import "package:http/http.dart";

abstract class DataState<T> {
  final T? data;
  final Response? response;

  const DataState({
    this.response,
    this.data,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(Response response) : super(response: response);
}
