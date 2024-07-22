import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/repositories/student_dashboard_payments_repository.dart';

class StudentDashboardPaymentsUseCase
    extends UseCase<DataState<List<StudentPaymentsDataList>>, Params> {
  final StudentDashboardPaymentsRepository _repository;

  StudentDashboardPaymentsUseCase({
    required StudentDashboardPaymentsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, DataState<List<StudentPaymentsDataList>>>> call(
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
