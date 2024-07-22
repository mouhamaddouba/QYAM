import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/mapper/notifications_mappers.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:qyam_novers_mobile/app/features/notifications/data/datasources/notifications_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/notifications/data/datasources/notifications_remote_datasource.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDatasource _remoteDatasource;
  final NotificationsLocaleDatasource _localDatasource;

  NotificationsRepositoryImpl({
    required NotificationsRemoteDatasource remoteDatasource,
    required NotificationsLocaleDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<NotificationsData>>>> getNotification({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getNotification(
          studyYear: studyYear,
          pageSize: pageSize,
          pageNumber: pageNumber,
          withPaging: withPaging,
        );

        // Store locally
        await _localDatasource.storeNotifications(
          dataList: result.data!.toEntityList,
        );

        return Right(
          DataState.done(
            data: result.data!.toDomainList,
            pagedList: result.pagedList,
          ),
        );
      }

      return Left(
        NoInternetConnectionFailure(),
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }
}
