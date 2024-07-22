import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/entities/student_classes.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/repositories/student_dashboard_classes_repository.dart';

class StudentDashboardClassesUseCase
    extends UseCase<DataState<List<StudentClasses>>, Params> {
  final StudentDashboardClassesRepository _repository;

  StudentDashboardClassesUseCase({
    required StudentDashboardClassesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<StudentClasses>>>> call(Params params) {
    return _repository.getClasses(
      isStudent: params.isStudent,
      studyYear: params.studyYear,
    );
  }
}

class Params {
  final String studyYear;
  final bool isStudent;

  Params({
    required this.studyYear,
    required this.isStudent,
  });
}
