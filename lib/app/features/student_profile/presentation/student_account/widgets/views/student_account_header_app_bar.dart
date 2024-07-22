import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/ui/student_account_ui_event.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

class StudentAccountHeaderAppBarView extends GetView<StudentAccountController> {
  const StudentAccountHeaderAppBarView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppDimensions.paddingOrMargin16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Button back
          AppIconWidget(
            containerColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.onPrimary
                : AppColors.darkOnPrimary,
            iconData: Icons.arrow_back_ios_rounded,
            color: Theme.of(context).primaryColor,
            withBackground: true,
            backgroundRadius: AppDimensions.radius10,
            backgroundSize: AppDimensions.iconSize40,
            onTap: () {
              controller.on(
                event: StudentAccountUiEvent.backtoDashboard(),
              );
            },
          ),

          // Text App bar
          AppTextWidget(
            AppStrings.profile.tr,
            fontSize: AppDimensions.fontSize12,
            fontWeight: FontWeight.bold,
            textColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.onPrimary
                : AppColors.darkOnPrimary,
          ),

          // Button login
          AppIconWidget(
            containerColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.onPrimary
                : AppColors.darkOnPrimary,
            iconData: Icons.logout,
            color: Theme.of(context).primaryColor,
            withBackground: true,
            backgroundRadius: AppDimensions.radius10,
            backgroundSize: AppDimensions.iconSize40,
            onTap: () {
              controller.on(
                event: StudentAccountUiEvent.logout(),
              );
            },
          ),
        ],
      ),
    );
  }
}
