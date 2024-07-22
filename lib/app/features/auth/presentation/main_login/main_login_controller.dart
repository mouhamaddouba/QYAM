// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/routes/app_pages.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/ui/main_login_ui_event.dart';

import 'ui/main_login_ui_state.dart';

class MainLoginController extends GetxController {
  //region State

  final state = MainLoginUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  //endregion Use Cases

  //region Constructors

  MainLoginController();

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

  //endregion Lifecycle

  //region Public functions

  void on({
    required MainLoginUiEvent event,
  }) {
    if (event is ToStudentLoginEvent) {
      _toStudentLogin(
        event: event,
      );
    } else if (event is ToTeacherLoginEvent) {
      _toTeacherLogin(
        event: event,
      );
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _toStudentLogin({
    required ToStudentLoginEvent event,
  }) {
    Get.toNamed(
      AppRoutes.studentLogin,
    );
  }

  void _toTeacherLogin({
    required ToTeacherLoginEvent event,
  }) {
    Get.toNamed(
      AppRoutes.teacherLogin,
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
