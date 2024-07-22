// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_alert_utils.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_default_dialog_widget.dart';

import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/auth/domain/entities/login_data.dart';
import 'package:qyam_novers_mobile/app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/ui/student_login_ui_state.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/ui/student_login_ui_event.dart';

import 'package:qyam_novers_mobile/app/routes/app_pages.dart';

class StudentLoginController extends GetxController {
  //region State

  final state = StudentLoginUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final LoginUseCase _loginUseCase;

  //endregion Use Cases

  //region Constructors

  StudentLoginController({
    required LoginUseCase loginUseCase,
  }) : _loginUseCase = loginUseCase;

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
      event: StudentLoginUiEvent.delayTimeOutHeader(),
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
    required StudentLoginUiEvent event,
  }) {
    if (event is DelayTimeOutHeaderEvent) {
      _delayTimeOutHeaderEvent(
        event: event,
      );
    } else if (event is BacktoLoginMainEvent) {
      _backtoLoginMainEvent(
        event: event,
      );
    } else if (event is PrefixPasswordEvent) {
      _prefixPasswordEvent(
        event: event,
      );
    } else if (event is StudentLoginEvent) {
      _studentLoginEvent(
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
        // Show header firsr
        state(
          state().copyWith(
            showHeader: false,
          ),
        );

        // delay
        await Future.delayed(
          const Duration(
            milliseconds: AppConstants.headerLoginDelay,
          ),
        );

        //show form
        state(
          state().copyWith(
            showForm: true,
          ),
        );
      },
    );
  }

  void _backtoLoginMainEvent({
    required BacktoLoginMainEvent event,
  }) {
    Get.back();
  }

  void _prefixPasswordEvent({
    required PrefixPasswordEvent event,
  }) {
    state(
      state().copyWith(
        showPassword: !event.showPassword,
      ),
    );
  }

  void _studentLoginEvent({
    required StudentLoginEvent event,
  }) async {
    var validationMessage = '';

    if (event.phoneNumber.isEmpty) {
      validationMessage += '- ${AppStrings.phoneNumberRequired.tr} \n';
    }

    if (event.password.isEmpty) {
      validationMessage += '- ${AppStrings.passwordRequired.tr} \n';
    }

    if (validationMessage.isNotEmpty) {
      AppAlertUtils.showDialog(
        title: AppStrings.alertWarning.tr,
        message: validationMessage.trim(),
        dialogTypeEnum: DialogTypeEnum.warning,
        textConfirm: AppStrings.ok.tr,
        // height: AppDimensions.height_18,
        // textAlign: TextAlign.start,
        onConfirm: () {
          Get.back();

          FocusScope.of(Get.overlayContext!).requestFocus(FocusNode());
        },
      );

      return;
    }

    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _loginUseCase.call(
      Params(
        phoneNumber: event.phoneNumber,
        password: event.password,
        byEmail: event.byEmail,
        email: event.email,
        remeberMe: event.remeberMe,
      ),
    );

    result.fold(
      (Failure failure) {
        AppAlertUtils.showDialog(
          title: AppStrings.alertError.tr,
          message: failure.message.tr,
          dialogTypeEnum: DialogTypeEnum.error,
          textConfirm: AppStrings.ok.tr,
          onConfirm: () {
            Get.back();

            FocusScope.of(Get.overlayContext!).requestFocus(FocusNode());

            state().phoneNumberController.clear();
            state().passwordController.clear();
          },
        );

        state(
          state().copyWith(
            isLoading: false,
          ),
        );
      },
      (LoginData data) async {
        if (!data.isStudent) {
          var massage = '';
          if (data.isTeacher) {
            massage = AppStrings.isTeacherNotStudent;
          } else if (data.isAccounter) {
            massage = AppStrings.isAccounterNotStudent;
          } else if (data.isStaff) {
            massage = AppStrings.isStaffNotStudent;
          }

          AppAlertUtils.showDialog(
            title: AppStrings.alertWarning.tr,
            message: massage,
            dialogTypeEnum: DialogTypeEnum.warning,
            textConfirm: AppStrings.ok.tr,
            onConfirm: () {
              Get.back();

              FocusScope.of(Get.overlayContext!).requestFocus(FocusNode());

              state().phoneNumberController.clear();
              state().passwordController.clear();
            },
          );

          state(
            state().copyWith(
              isLoading: false,
            ),
          );

          return;
        } else if (data.isStudent) {
          //  Store user (LoginData)
          await AppStorage.write(
            AppStorage.isLoggedIn,
            true,
          );

          await AppStorage.write(
            AppStorage.isStudent,
            true,
          );

          await AuthUserUtils.saveLoginData(
            loginData: data,
          );

          Get.offAllNamed(
            AppRoutes.studentDashboard,
          );
        }
      },
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
