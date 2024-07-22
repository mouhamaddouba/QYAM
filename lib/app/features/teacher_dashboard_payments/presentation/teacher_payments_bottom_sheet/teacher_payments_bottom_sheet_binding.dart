import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments_bottom_sheet/teacher_payments_bottom_sheet_controller.dart';

class TeacherPaymentsBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TeacherPaymentsBottomSheetController(),
    );
  }
}
