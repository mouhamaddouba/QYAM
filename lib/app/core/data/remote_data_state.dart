import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

abstract class RemoteDataState<T> {
  final T data;
  final PagedList? pagedList;

  const RemoteDataState._({
    required this.data,
    this.pagedList,
  });

  factory RemoteDataState.done({
    required T data,
    PagedList? pagedList,
  }) = RemoteDoneState<T>;
}

class RemoteDoneState<T> extends RemoteDataState<T> {
  const RemoteDoneState({
    required T data,
    PagedList? pagedList,
  }) : super._(
          data: data,
          pagedList: pagedList,
        );
}
