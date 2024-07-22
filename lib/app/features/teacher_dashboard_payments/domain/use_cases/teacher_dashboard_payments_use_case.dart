import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/entities/teacher_payments.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/repositories/teacher_dashboard_payments_repository.dart';

class TeacherDashboardPaymentsUseCase
    extends UseCase<DataState<List<TeacherPaymentsDataList>>, Params> {
  final TeacherDashboardPaymentsRepository _repository;

  TeacherDashboardPaymentsUseCase({
    required TeacherDashboardPaymentsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<TeacherPaymentsDataList>>>> call(
      Params params) {
    return _repository.getPayments(
      studyYear: params.studyYear,
      pageNumber: params.pageNumber,
      pageSize: params.pageSize,
      withPaging: params.withPaging,
    );
  }
}

class Params {
  final String studyYear;
  final int pageSize;
  final int pageNumber;
  final bool withPaging;

  Params({
    required this.studyYear,
    required this.pageSize,
    required this.pageNumber,
    required this.withPaging,
  });
}
