import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_controller.dart';

class StudentAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      StudentAccountController(),
    );
  }
}
