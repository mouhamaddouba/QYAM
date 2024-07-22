import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/splash/presentation/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
