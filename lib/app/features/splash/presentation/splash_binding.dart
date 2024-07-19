import 'package:get/get.dart';
import 'package:qyam/app/features/splash/presentation/provider/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
