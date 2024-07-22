import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/entities/teacher_exams.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/mapper/teacher_exams_mappers.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/repositories/teacher_dashboard_exams_repository.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/datasources/teacher_dashboard_exams_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/datasources/teacher_dashboard_exams_remote_datasource.dart';

class TeacherDashboardExamsRepositoryImpl
    implements TeacherDashboardExamsRepository {
  final TeacherDashboardExamsRemoteDatasource _remoteDatasource;
  final TeacherDashboardExamsLocaleDatasource _localDatasource;

  TeacherDashboardExamsRepositoryImpl({
    required TeacherDashboardExamsRemoteDatasource remoteDatasource,
    required TeacherDashboardExamsLocaleDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<TeacherExams>>>> getExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getExams(
          studyYear: studyYear,
          pageSize: pageSize,
          pageNumber: pageNumber,
          withPaging: withPaging,
          status: status,
        );

        // Store locally
        await _localDatasource.storeExams(
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
      final localDataList = await _localDatasource.getExams();
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
