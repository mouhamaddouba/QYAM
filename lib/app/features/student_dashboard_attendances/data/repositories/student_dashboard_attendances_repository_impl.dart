import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/entities/student_attendances.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/mapper/student_attendances_mappers.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/repositories/student_dashboard_attendances_repository.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/datasources/student_dashboard_attendances_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/datasources/student_dashboard_attendances_remote_datasource.dart';

class StudentDashboardAttendancesRepositoryImpl
    implements StudentDashboardAttendancesRepository {
  final StudentDashboardAttendancesRemoteDatasource _remoteDatasource;
  final StudentDashboardAttendancesLocaleDatasource _localDatasource;

  StudentDashboardAttendancesRepositoryImpl({
    required StudentDashboardAttendancesRemoteDatasource remoteDatasource,
    required StudentDashboardAttendancesLocaleDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<StudentAttendances>>>> getAttendances({
    required String studyYear,
    required String year,
    required String month,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getAttendances(
          studyYear: studyYear,
          year: year,
          month: month,
        );

        // Store locally
        await _localDatasource.storeAttendances(
          dataList: result!.toEntityList,
        );

        return Right(
          DataState.done(
            data: result.toDomainList,
          ),
        );
      }

      // Not connected to internet, get dataList from local
      final localDataList = await _localDatasource.getAttendances();
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
