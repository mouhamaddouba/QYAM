import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/entities/teacher_lates.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/mapper/teacher_lates_mappers.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/datasources/teacher_dashboard_lates_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/datasources/teacher_dashboard_lates_remote_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/repositories/teacher_dashboard_lates_repository.dart';

class TeacherDashboardLatesRepositoryImpl
    implements TeacherDashboardLatesRepository {
  final TeacherDashboardLatesRemoteDatasource _remoteDatasource;
  final TeacherDashboardLatesLocaleDatasource _localDatasource;

  TeacherDashboardLatesRepositoryImpl({
    required TeacherDashboardLatesRemoteDatasource remoteDatasource,
    required TeacherDashboardLatesLocaleDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<TeacherLates>>>> getLates({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String toDate,
    required String fromDate,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getLates(
          studyYear: studyYear,
          pageSize: pageSize,
          pageNumber: pageNumber,
          withPaging: withPaging,
          fromDate: fromDate,
          toDate: toDate,
        );

        // Store locally
        await _localDatasource.storeLates(
          dataList: result!.toEntityList,
        );

        return Right(
          DataState.done(
            data: result.toDomainList,
          ),
        );
      }

      // Not connected to internet, get dataList from local
      final localDataList = await _localDatasource.getLates();
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
