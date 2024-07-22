import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/student_dashboard_attendances_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/use_cases/student_dashboard_attendances_use_case.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/repositories/student_dashboard_attendances_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/datasources/student_dashboard_attendances_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/datasources/student_dashboard_attendances_remote_datasource.dart';

class StudentDashboardAttendancesBinding extends Bindings {
  @override
  void dependencies() {
    final attendancesRepository = StudentDashboardAttendancesRepositoryImpl(
      remoteDatasource: StudentDashboardAttendancesRemoteDatasourceImpl(),
      localDatasource: StudentDashboardAttendancesLocalDatasourceImpl(),
    );

    final getAttendancesUseCase = StudentDashboardAttendancesUseCase(
      repository: attendancesRepository,
    );

    Get.lazyPut(
      () => StudentDashboardAttendancesController(
        getAttendancesUseCase: getAttendancesUseCase,
      ),
    );
  }
}
