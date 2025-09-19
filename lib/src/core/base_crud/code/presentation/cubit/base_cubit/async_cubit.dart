import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../../../../config/res/config_imports.dart';
import '../../../../../error/failure.dart';
import '../../../../../shared/base_state.dart';
import '../../../../../widgets/custom_messages.dart';
import '../../../domain/base_domain_imports.dart';

part 'async_state.dart';
part 'async_event.dart';

abstract class AsyncBloc<T> extends Bloc<AsyncEvent<T>, AsyncState<T>> {
  AsyncBloc(T initialData) : super(AsyncState.initial(data: initialData)) {
    baseCrudUseCase = injector();
    on<ExecuteAsyncEvent<T>>(executeAsyncEvent);
  }
  late final BaseCrudUseCase baseCrudUseCase;
  void setLoading(Emitter<AsyncState<T>> emit) {
    emit(state.loading());
  }

  void setLoadingMore(Emitter<AsyncState<T>> emit) {
    emit(state.loadingMore());
  }

  void setSuccess(Emitter<AsyncState<T>> emit, {required T data}) {
    emit(state.success(data: data));
  }

  void setError(Emitter<AsyncState<T>> emit,
      {String? errorMessage, bool showToast = false}) {
    if (showToast && errorMessage != null) {
      MessageUtils.showSnackBar(errorMessage);
    }
    emit(state.error(errorMessage: errorMessage));
  }

  void reset(Emitter<AsyncState<T>> emit) {
    emit(AsyncState.initial(data: state.data));
  }

  void updateData(Emitter<AsyncState<T>> emit, T data) {
    emit(state.copyWith(data: data));
  }

  void updateErrorMessage(Emitter<AsyncState<T>> emit, String? errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }

  bool get isLoading => state.isLoading;

  FutureOr<void> executeAsyncEvent(
    ExecuteAsyncEvent<T> event,
    Emitter<AsyncState<T>> emit,
  ) async =>
      executeAsync;

  Future<void> executeAsync({
    required Future<Result<T, Failure>> Function() operation,
    Function(T)? successEmitter,
    required Emitter<AsyncState<T>> emit,
  }) async {
    setLoading(emit);
    final result = await operation();
    result.when(
      (success) {
        setSuccess(emit, data: success);
        if (successEmitter != null) {
          successEmitter(success);
        }
      },
      (failure) {
        MessageUtils.showSnackBar(failure.message);
        setError(emit, errorMessage: failure.message);
      },
    );
  }
}
