import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/teacher_profile_controller.dart';

class TeacherProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      TeacherProfileController(),
    );
  }
}
