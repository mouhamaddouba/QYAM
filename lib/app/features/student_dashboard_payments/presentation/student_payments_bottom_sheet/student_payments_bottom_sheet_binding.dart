import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments_bottom_sheet/student_payments_bottom_sheet_controller.dart';

class StudentPaymentsBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StudentPaymentsBottomSheetController(),
    );
  }
}
