import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/teacher_dashboard_lates_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/use_cases/teacher_dashboard_lates_use_case.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/datasources/teacher_dashboard_lates_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/repositories/teacher_dashboard_lates_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/datasources/teacher_dashboard_lates_remote_datasource.dart';

class TeacherDashboardLatesBinding extends Bindings {
  @override
  void dependencies() {
    final latesRepository = TeacherDashboardLatesRepositoryImpl(
      remoteDatasource: TeacherDashboardLatesRemoteDatasourceImpl(),
      localDatasource: TeacherDashboardLatesLocalDatasourceImpl(),
    );

    final getLatesUseCase = TeacherDashboardLatesUseCase(
      repository: latesRepository,
    );

    Get.lazyPut(
      () => TeacherDashboardLatesController(
        getLatesUseCase: getLatesUseCase,
      ),
    );
  }
}
