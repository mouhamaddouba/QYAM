import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/repositories/notifications_repository.dart';

class NotificationsUseCase
    extends UseCase<DataState<List<NotificationsData>>, Params> {
  final NotificationsRepository _repository;

  NotificationsUseCase({
    required NotificationsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<NotificationsData>>>> call(
      Params params) {
    return _repository.getNotification(
      pageSize: params.pageSize,
      pageNumber: params.pageNumber,
      withPaging: params.withPaging,
      studyYear: params.studyYear,
    );
  }
}

class Params {
  final String studyYear;
  final int pageSize;
  final int pageNumber;
  final bool withPaging;

  Params({
    required this.studyYear,
    required this.pageSize,
    required this.pageNumber,
    required this.withPaging,
  });
}
