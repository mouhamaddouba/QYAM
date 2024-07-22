import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/entities/student_attendances.dart';

abstract class StudentDashboardAttendancesRepository {
  Future<Either<Failure, DataState<List<StudentAttendances>>>> getAttendances({
    required String studyYear,
    required String year,
    required String month,
  });
}
