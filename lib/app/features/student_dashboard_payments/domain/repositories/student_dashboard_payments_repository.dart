import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';

abstract class StudentDashboardPaymentsRepository {
  Future<Either<Failure, DataState<List<StudentPaymentsDataList>>>>
      getPayments({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  });
}
