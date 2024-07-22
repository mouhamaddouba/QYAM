// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/themes/app_themes.dart';
import 'package:qyam_novers_mobile/app/core/translations/app_translations.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_alert_utils.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/ui/student_profile_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/ui/student_profile_ui_state.dart';

import 'package:qyam_novers_mobile/app/routes/app_pages.dart';

class StudentProfileController extends GetxController {
  //region State

  final state = StudentProfileUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  //endregion Use Cases

  //region Constructors

  StudentProfileController();

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
    required StudentProfileUiEvent event,
  }) {
    if (event is BacktoDashboardEvent) {
      _backtoDashboardEvent(
        event: event,
      );
    } else if (event is ToNotificationEvent) {
      _toNotificationEvent(
        event: event,
      );
    } else if (event is LogoutEvent) {
      _logoutEvent(
        event: event,
      );
    } else if (event is ToAccountEvent) {
      _toAccountEvent(
        event: event,
      );
    } else if (event is ChangeToArabicEvent) {
      _changeToArabicEvent(
        event: event,
      );
    } else if (event is ChangeToEnglishEvent) {
      _changeToEnglishEvent(
        event: event,
      );
    } else if (event is ChangeToLightThemeEvent) {
      _changeToLightThemeEvent(
        event: event,
      );
    } else if (event is ChangeToDarkThemeEvent) {
      _changeToDarkThemeEvent(
        event: event,
      );
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _backtoDashboardEvent({
    required BacktoDashboardEvent event,
  }) {
    Get.back();
  }

  void _toNotificationEvent({
    required ToNotificationEvent event,
  }) {
    Get.toNamed(
      AppRoutes.notifications,
    );
  }

  void _toAccountEvent({
    required ToAccountEvent event,
  }) {
    Get.toNamed(
      AppRoutes.studentAccount,
    );
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

  void _changeToArabicEvent({
    required ChangeToArabicEvent event,
  }) async {
    AppTranslations.changeLocale(
      AppTranslations.arabicLang,
    );
  }

  void _changeToEnglishEvent({
    required ChangeToEnglishEvent event,
  }) async {
    AppTranslations.changeLocale(
      AppTranslations.englishLang,
    );
  }

  void _changeToLightThemeEvent({
    required ChangeToLightThemeEvent event,
  }) {
    AppThemes.changeTheme(
      theme: AppThemes.theme01,
      isDarkMode: false,
    );
  }

  void _changeToDarkThemeEvent({
    required ChangeToDarkThemeEvent event,
  }) {
    AppThemes.changeTheme(
      theme: AppThemes.theme02,
      isDarkMode: true,
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
