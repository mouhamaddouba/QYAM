import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/notifications_details_controller.dart';

class NotificationsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NotificationsDetailsController(),
    );
  }
}
