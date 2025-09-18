part of 'async_cubit.dart';

sealed class AsyncEvent<T> {}

class ExecuteAsyncEvent<T> extends AsyncEvent<T> {
  ExecuteAsyncEvent();
}
