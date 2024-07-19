import 'package:get/get.dart';
import 'package:qyam/app/features/splash/presentation/splash_binding.dart';
import 'package:qyam/app/features/splash/presentation/splash_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    ///splash
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
