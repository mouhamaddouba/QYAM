import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/entities/teacher_lates.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/repositories/teacher_dashboard_lates_repository.dart';

class TeacherDashboardLatesUseCase
    extends UseCase<DataState<List<TeacherLates>>, Params> {
  final TeacherDashboardLatesRepository _repository;

  TeacherDashboardLatesUseCase({
    required TeacherDashboardLatesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<TeacherLates>>>> call(Params params) {
    return _repository.getLates(
      studyYear: params.studyYear,
      pageSize: params.pageSize,
      pageNumber: params.pageNumber,
      withPaging: params.withPaging,
      toDate: params.toDate,
      fromDate: params.fromDate,
    );
  }
}

class Params {
  final String studyYear;
  final int pageSize;
  final int pageNumber;
  final bool withPaging;
  final String toDate;
  final String fromDate;

  Params({
    required this.studyYear,
    required this.pageSize,
    required this.pageNumber,
    required this.withPaging,
    required this.toDate,
    required this.fromDate,
  });
}
