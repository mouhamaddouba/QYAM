import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/domain/entities/student_exams.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/domain/repositories/student_dashboard_exams_repository.dart';

class StudentDashboardExamsUseCase
    extends UseCase<DataState<List<StudentExams>>, Params> {
  final StudentDashboardExamsRepository _repository;

  StudentDashboardExamsUseCase({
    required StudentDashboardExamsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<StudentExams>>>> call(Params params) {
    return _repository.getExams(
      studyYear: params.studyYear,
      pageSize: params.pageSize,
      pageNumber: params.pageNumber,
      withPaging: params.withPaging,
      status: params.status,
    );
  }
}

class Params {
  final String studyYear;
  final int pageSize;
  final int pageNumber;
  final bool withPaging;
  final String status;

  Params({
    required this.studyYear,
    required this.pageSize,
    required this.pageNumber,
    required this.withPaging,
    required this.status,
  });
}
