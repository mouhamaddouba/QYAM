import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/entities/student_classes.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/mapper/student_classes_mappers.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/repositories/student_dashboard_classes_repository.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/datasources/student_dashboard_classes_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/datasources/student_dashboard_classes_remote_datasource.dart';

class StudentDashboardClassesRepositoryImpl
    implements StudentDashboardClassesRepository {
  final StudentDashboardClassesRemoteDatasource _remoteDatasource;
  final StudentDashboardClassesLocaleDatasource _localDatasource;

  StudentDashboardClassesRepositoryImpl({
    required StudentDashboardClassesRemoteDatasource remoteDatasource,
    required StudentDashboardClassesLocaleDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<StudentClasses>>>> getClasses({
    required String studyYear,
    required bool isStudent,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.getClasses(
          isStudent: isStudent,
          studyYear: studyYear,
        );

        // Store locally
        await _localDatasource.storeClasses(
          dataList: result!.toEntityList,
        );

        return Right(
          DataState.done(
            data: result.toDomainList,
          ),
        );
      }

      // Not connected to internet, get dataList from local
      final localDataList = await _localDatasource.getClasses();
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
