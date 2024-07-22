import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/student_dashboard_exams_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/domain/use_cases/student_dashboard_exams_use_case.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/data/datasources/student_dashboard_exams_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/data/repositories/student_dashboard_exams_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/data/datasources/student_dashboard_exams_remote_datasource.dart';

class StudentDashboardExamsBinding extends Bindings {
  @override
  void dependencies() {
    final examsRepository = StudentDashboardExamsRepositoryImpl(
      remoteDatasource: StudentDashboardExamsRemoteDatasourceImpl(),
      localDatasource: StudentDashboardExamsLocalDatasourceImpl(),
    );

    final getExamsUseCase = StudentDashboardExamsUseCase(
      repository: examsRepository,
    );

    Get.lazyPut(
      () => StudentDashboardExamsController(
        getExamsUseCase: getExamsUseCase,
      ),
    );
  }
}
