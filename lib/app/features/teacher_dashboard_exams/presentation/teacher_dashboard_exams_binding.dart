import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/teacher_dashboard_exams_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/use_cases/teacher_dashboard_exams_use_case.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/datasources/teacher_dashboard_exams_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/repositories/teacher_dashboard_exams_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/datasources/teacher_dashboard_exams_remote_datasource.dart';

class TeacherDashboardExamsBinding extends Bindings {
  @override
  void dependencies() {
    final examsRepository = TeacherDashboardExamsRepositoryImpl(
      remoteDatasource: TeacherDashboardExamsRemoteDatasourceImpl(),
      localDatasource: TeacherDashboardExamsLocalDatasourceImpl(),
    );

    final getExamsUseCase = TeacherDashboardExamsUseCase(
      repository: examsRepository,
    );

    Get.lazyPut(
      () => TeacherDashboardExamsController(
        getExamsUseCase: getExamsUseCase,
      ),
    );
  }
}
