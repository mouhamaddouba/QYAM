import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_button_widget.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_default_dialog_widget.dart';

abstract class AppAlertUtils {
  static void showSnackBar({
    required String title,
    required String message,
    Color backgroundColor = AppColors.primary,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    int durationSeconds = AppConstants.duration05,
  }) {
    Get.snackbar(
      title,
      message,
      duration: Duration(
        seconds: durationSeconds,
      ),
      borderRadius: AppDimensions.radius10,
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(
        AppDimensions.paddingOrMargin8,
      ),
      titleText: Text(
        title,
        style: const TextStyle(
          fontSize: AppDimensions.fontSize10,
          color: AppColors.white01,
          fontWeight: FontWeight.w400,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: AppDimensions.fontSize12,
          color: AppColors.white01,
        ),
      ),
    );
  }

  static Future<dynamic> showDialog({
    String? title = AppStrings.alert,
    String message = '',
    Widget? icon,
    DialogTypeEnum dialogTypeEnum = DialogTypeEnum.primary,
    String? textConfirm,
    String? textCancel,
    Widget? content,
    bool barrierDismissible = true,
    List<AppButtonWidget> actionButtons = const [],
    Function()? onConfirm,
    Function()? onCancel,
    Function(dynamic)? onAfter,
  }) {
    return Get.dialog(
      AppDefaultDialogWidget(
        title: title,
        message: message,
        icon: icon,
        dialogTypeEnum: dialogTypeEnum,
        content: content,
        textConfirm: textConfirm,
        textCancel: textCancel,
        actionButtons: actionButtons,
        onConfirm: onConfirm ??
            () {
              Get.back();
            },
        onCancel: onCancel,
      ),
      barrierDismissible: barrierDismissible,
    ).then(
      (value) {
        if (onAfter != null) {
          onAfter(value);
        }
      },
    );
  }
}
