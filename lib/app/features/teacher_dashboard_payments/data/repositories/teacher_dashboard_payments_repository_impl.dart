import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/entities/teacher_payments.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/mapper/teacher_payments_mappers.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/repositories/teacher_dashboard_payments_repository.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/data/datasources/teacher_dashboard_payments_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/data/datasources/teacher_dashboard_payments_remote_datasource.dart';

class TeacherDashboardPaymentsRepositoryImpl
    implements TeacherDashboardPaymentsRepository {
  final TeacherDashboardPaymentsRemoteDatasource _remoteDatasource;
  final TeacherDashboardPaymentsLocaleDatasource _localDatasource;

  TeacherDashboardPaymentsRepositoryImpl({
    required TeacherDashboardPaymentsRemoteDatasource remoteDatasource,
    required TeacherDashboardPaymentsLocaleDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<TeacherPaymentsDataList>>>>
      getPayments({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getPayments(
          studyYear: studyYear,
          pageSize: pageSize,
          pageNumber: pageNumber,
          withPaging: withPaging,
        );

        // Store locally
        await _localDatasource.storePayments(
          dataList: result.data!.toEntityList,
        );

        return Right(
          DataState.done(
            data: result.data!.toDomainList,
            pagedList: result.pagedList,
          ),
        );
      }

      // Not connected to internet, get dataList from local
      final localDataList = await _localDatasource.getPayments();
      if (localDataList.isNotEmpty) {
        return Right(
          DataState.done(
            data: localDataList.toDomainList,
            failure: NoInternetConnectionFailure(),
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
