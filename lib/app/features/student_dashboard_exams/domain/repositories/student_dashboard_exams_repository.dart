import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/domain/entities/student_exams.dart';

abstract class StudentDashboardExamsRepository {
  Future<Either<Failure, DataState<List<StudentExams>>>> getExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  });
}
