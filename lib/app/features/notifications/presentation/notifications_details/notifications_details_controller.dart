// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'ui/notifications_details_ui_state.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_arguments_keys.dart';

class NotificationsDetailsController extends GetxController {
  //region State

  final state = NotificationsDetailsUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  //endregion Use Cases

  //region Constructors

  //endregion Constructors

  //region Lifecycle

  @override
  InternalFinalCallback<void> get onStart {
    return super.onStart;
  }

  @override
  void onInit() {
    super.onInit();

    _workers();
    _processArguments();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    return super.onDelete;
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {
    if (Get.arguments != null) {
      if (Get.arguments[AppArgumentsKeys.notificationId] != null) {
        state(
          state().copyWith(
            notificationsData: Get.arguments[AppArgumentsKeys.notificationId],
          ),
        );
        print(Get.arguments[AppArgumentsKeys.notificationId]);
      }
    }
  }

//endregion Private functions
}
