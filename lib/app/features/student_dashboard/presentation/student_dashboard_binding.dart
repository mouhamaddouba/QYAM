import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard/presentation/student_dashboard_controller.dart';

class StudentDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StudentDashboardController(),
    );
  }
}
