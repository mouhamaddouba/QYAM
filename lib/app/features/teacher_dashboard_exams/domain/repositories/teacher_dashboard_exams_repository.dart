import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/entities/teacher_exams.dart';

abstract class TeacherDashboardExamsRepository {
  Future<Either<Failure, DataState<List<TeacherExams>>>> getExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  });
}
