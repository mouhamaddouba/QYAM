import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/student_dashboard_payments_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/use_cases/student_dashboard_payments_use_case.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/repositories/student_dashboard_payments_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/datasources/student_dashboard_payments_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/datasources/student_dashboard_payments_remote_datasource.dart';

class StudentDashboardPaymentsBinding extends Bindings {
  @override
  void dependencies() {
    final paymentsRepository = StudentDashboardPaymentsRepositoryImpl(
      remoteDatasource: StudentDashboardPaymentsRemoteDatasourceImpl(),
      localDatasource: StudentDashboardPaymentsLocalDatasourceImpl(),
    );

    final getPaymentsUseCase = StudentDashboardPaymentsUseCase(
      repository: paymentsRepository,
    );

    Get.lazyPut(
      () => StudentDashboardPaymentsController(
        getPaymentsUseCase: getPaymentsUseCase,
      ),
    );
  }
}
