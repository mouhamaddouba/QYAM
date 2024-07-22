import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_controller.dart';

class StudentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      StudentProfileController(),
    );
  }
}
