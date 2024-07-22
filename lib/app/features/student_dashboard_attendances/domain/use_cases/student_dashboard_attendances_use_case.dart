import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/entities/student_attendances.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/repositories/student_dashboard_attendances_repository.dart';

class StudentDashboardAttendancesUseCase
    extends UseCase<DataState<List<StudentAttendances>>, Params> {
  final StudentDashboardAttendancesRepository _repository;

  StudentDashboardAttendancesUseCase({
    required StudentDashboardAttendancesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<StudentAttendances>>>> call(
      Params params) {
    return _repository.getAttendances(
      studyYear: params.studyYear,
      year: params.year,
      month: params.month,
    );
  }
}

class Params {
  final String studyYear;
  final String year;
  final String month;

  Params({
    required this.studyYear,
    required this.year,
    required this.month,
  });
}
