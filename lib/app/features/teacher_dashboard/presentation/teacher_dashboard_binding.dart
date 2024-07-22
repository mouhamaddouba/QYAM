import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard/presentation/teacher_dashboard_controller.dart';

class TeacherDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TeacherDashboardController(),
    );
  }
}
