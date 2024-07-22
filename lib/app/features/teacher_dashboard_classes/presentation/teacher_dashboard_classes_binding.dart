import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/teacher_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/use_cases/teacher_dashboard_classes_use_case.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/data/repositories/teacher_dashboard_classes_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/data/datasources/teacher_dashboard_classes_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/data/datasources/teacher_dashboard_classes_remote_datasource.dart';

class TeacherDashboardClassesBinding extends Bindings {
  @override
  void dependencies() {
    final classesRepository = TeacherDashboardClassesRepositoryImpl(
      remoteDatasource: TeacherDashboardClassesRemoteDatasourceImpl(),
      localDatasource: TeacherDashboardClassesLocalDatasourceImpl(),
    );

    final getClassesUseCase = TeacherDashboardClassesUseCase(
      repository: classesRepository,
    );

    Get.lazyPut(
      () => TeacherDashboardClassesController(
        getClassesUseCase: getClassesUseCase,
      ),
    );
  }
}
