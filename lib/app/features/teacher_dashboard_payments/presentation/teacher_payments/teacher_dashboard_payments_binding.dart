import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/use_cases/teacher_dashboard_payments_use_case.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/data/repositories/teacher_dashboard_payments_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/data/datasources/teacher_dashboard_payments_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/data/datasources/teacher_dashboard_payments_remote_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/teacher_dashboard_payments_controller.dart';

class TeacherDashboardPaymentsBinding extends Bindings {
  @override
  void dependencies() {
    final paymentsRepository = TeacherDashboardPaymentsRepositoryImpl(
      remoteDatasource: TeacherDashboardPaymentsRemoteDatasourceImpl(),
      localDatasource: TeacherDashboardPaymentsLocalDatasourceImpl(),
    );

    final getPaymentsUseCase = TeacherDashboardPaymentsUseCase(
      repository: paymentsRepository,
    );

    Get.lazyPut(
      () => TeacherDashboardPaymentsController(
        getPaymentsUseCase: getPaymentsUseCase,
      ),
    );
  }
}
