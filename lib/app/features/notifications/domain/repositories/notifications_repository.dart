import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, DataState<List<NotificationsData>>>> getNotification({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  });
}
