import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/entities/student_classes.dart';

abstract class StudentDashboardClassesRepository {
  Future<Either<Failure, DataState<List<StudentClasses>>>> getClasses({
    required String studyYear,
    required bool isStudent,
  });
}
