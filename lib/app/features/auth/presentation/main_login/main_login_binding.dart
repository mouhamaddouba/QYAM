import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/main_login_controller.dart';

class MainLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MainLoginController(),
    );
  }
}
