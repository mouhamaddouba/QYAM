import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/teacher_account_controller.dart';

class TeacherAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      TeacherAccountController(),
    );
  }
}
