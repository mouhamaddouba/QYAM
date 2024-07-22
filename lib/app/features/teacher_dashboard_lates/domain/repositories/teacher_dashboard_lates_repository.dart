import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/entities/teacher_lates.dart';

abstract class TeacherDashboardLatesRepository {
  Future<Either<Failure, DataState<List<TeacherLates>>>> getLates({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String toDate,
    required String fromDate,
  });
}
