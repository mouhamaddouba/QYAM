import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/entities/teacher_classes.dart';

abstract class TeacherDashboardClassesRepository {
  Future<Either<Failure, DataState<List<TeacherClasses>>>> getClasses({
    required String studyYear,
    required bool isStudent,
  });
}
