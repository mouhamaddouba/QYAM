import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/mapper/student_payments_mappers.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/repositories/student_dashboard_payments_repository.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/datasources/student_dashboard_payments_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/datasources/student_dashboard_payments_remote_datasource.dart';

class StudentDashboardPaymentsRepositoryImpl
    implements StudentDashboardPaymentsRepository {
  final StudentDashboardPaymentsRemoteDatasource _remoteDatasource;
  final StudentDashboardPaymentsLocaleDatasource _localDatasource;

  StudentDashboardPaymentsRepositoryImpl({
    required StudentDashboardPaymentsRemoteDatasource remoteDatasource,
    required StudentDashboardPaymentsLocaleDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<StudentPaymentsDataList>>>>
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
