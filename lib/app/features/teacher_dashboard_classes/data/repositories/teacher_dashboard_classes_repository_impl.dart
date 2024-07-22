import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/entities/teacher_classes.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/mapper/teacher_classes_mappers.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/repositories/teacher_dashboard_classes_repository.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/data/datasources/teacher_dashboard_classes_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/data/datasources/teacher_dashboard_classes_remote_datasource.dart';

class TeacherDashboardClassesRepositoryImpl
    implements TeacherDashboardClassesRepository {
  final TeacherDashboardClassesRemoteDatasource _remoteDatasource;
  final TeacherDashboardClassesLocaleDatasource _localDatasource;

  TeacherDashboardClassesRepositoryImpl({
    required TeacherDashboardClassesRemoteDatasource remoteDatasource,
    required TeacherDashboardClassesLocaleDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  @override
  Future<Either<Failure, DataState<List<TeacherClasses>>>> getClasses({
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
