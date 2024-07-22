import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/use_cases/student_dashboard_classes_use_case.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/datasources/student_dashboard_classes_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/repositories/student_dashboard_classes_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/datasources/student_dashboard_classes_remote_datasource.dart';

class StudentDashboardClassesBinding extends Bindings {
  @override
  void dependencies() {
    final classesRepository = StudentDashboardClassesRepositoryImpl(
      remoteDatasource: StudentDashboardClassesRemoteDatasourceImpl(),
      localDatasource: StudentDashboardClassesLocalDatasourceImpl(),
    );

    final getClassesUseCase = StudentDashboardClassesUseCase(
      repository: classesRepository,
    );

    Get.lazyPut(
      () => StudentDashboardClassesController(
        getClassesUseCase: getClassesUseCase,
      ),
    );
  }
}
