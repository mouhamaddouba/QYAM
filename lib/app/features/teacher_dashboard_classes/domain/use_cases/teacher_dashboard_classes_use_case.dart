import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/entities/teacher_classes.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/repositories/teacher_dashboard_classes_repository.dart';

class TeacherDashboardClassesUseCase
    extends UseCase<DataState<List<TeacherClasses>>, Params> {
  final TeacherDashboardClassesRepository _repository;

  TeacherDashboardClassesUseCase({
    required TeacherDashboardClassesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<TeacherClasses>>>> call(Params params) {
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
