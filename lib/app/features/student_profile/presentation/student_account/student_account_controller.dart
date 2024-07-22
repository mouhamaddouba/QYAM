// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_alert_utils.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/ui/student_account_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/ui/student_account_ui_state.dart';

import 'package:qyam_novers_mobile/app/routes/app_pages.dart';

class StudentAccountController extends GetxController {
  //region State

  final state = StudentAccountUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  //endregion Use Cases

  //region Constructors

  StudentAccountController();

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

    on(
      event: StudentAccountUiEvent.delayTimeOutHeader(),
    );
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

  //endregion Lifecycle

  //region Public functions

  void on({
    required StudentAccountUiEvent event,
  }) {
    if (event is DelayTimeOutHeaderEvent) {
      _delayTimeOutHeaderEvent(
        event: event,
      );
    } else if (event is BacktoDashboardEvent) {
      _backtoDashboardEvent(
        event: event,
      );
    } else if (event is LogoutEvent) {
      _logoutEvent(
        event: event,
      );
    } else if (event is DeleteImageEvent) {
      _deleteImageEvent(
        event: event,
      );
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _delayTimeOutHeaderEvent({
    required DelayTimeOutHeaderEvent event,
  }) {
    Future.delayed(
      const Duration(
        milliseconds: AppConstants.headerLoginDelay,
      ),
      () async {
        state(
          state().copyWith(
            showHeader: false,
          ),
        );

        state(
          state().copyWith(
            showForm: true,
          ),
        );
      },
    );
  }

  void _backtoDashboardEvent({
    required BacktoDashboardEvent event,
  }) {
    Get.back();
  }

  void _logoutEvent({
    required LogoutEvent event,
  }) {
    AppAlertUtils.showDialog(
      title: AppStrings.logoutAlert.tr,
      textConfirm: AppStrings.confirm.tr,
      textCancel: AppStrings.cancel.tr,
      onConfirm: () {
        AppStorage.remove(
          AppStorage.isLoggedIn,
        );

        Get.offAllNamed(
          AppRoutes.splash,
        );
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  void _deleteImageEvent({
    required DeleteImageEvent event,
  }) {
    // AuthUserUtils.image.isNotEmpty == AppConstants.emptyText;
    //Get.back();
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
