import 'package:qyam/app/core/error/failures.dart';
import 'package:qyam/app/core/network_response/network_response.dart';

abstract class DataState<T> {
  final T data;
  final PagedList? pagedList;
  final Failure? failure;

  const DataState._({
    required this.data,
    this.pagedList,
    this.failure,
  });

  factory DataState.done({
    required T data,
    PagedList? pagedList,
    Failure? failure,
  }) = DoneState<T>;

  factory DataState.loading({
    required T data,
  }) = LoadingState<T>;
}

class DoneState<T> extends DataState<T> {
  const DoneState({
    required T data,
    PagedList? pagedList,
    Failure? failure,
  }) : super._(
          data: data,
          pagedList: pagedList,
          failure: failure,
        );
}

class LoadingState<T> extends DataState<T> {
  const LoadingState({
    required T data,
  }) : super._(
          data: data,
        );
}
