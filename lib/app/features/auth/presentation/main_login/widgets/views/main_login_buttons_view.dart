import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_button_widget.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/main_login_controller.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/ui/main_login_ui_event.dart';

class MainLoginButtonsView extends GetView<MainLoginController> {
  const MainLoginButtonsView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Button Student
          AppButtonWidget(
            text: AppStrings.student.tr,
            textColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.onPrimary
                : AppColors.darkOnPrimary,
            width: AppDimensions.width160.w,
            height: AppDimensions.height60,
            color: Theme.of(context).primaryColor,
            icon: AppIconWidget(
              iconPath: AppAssets.studentIcon,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.onPrimary
                  : AppColors.darkOnPrimary,
            ),
            onPressed: () {
              controller.on(
                event: MainLoginUiEvent.toStudentLogin(),
              );
            },
          ),

          // Space
          const SizedBox(
            width: AppDimensions.paddingOrMargin16,
          ),

          // Button Teacher
          AppButtonWidget(
            text: AppStrings.teacher.tr,
            textColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.onPrimary
                : AppColors.darkOnPrimary,
            width: AppDimensions.width160.w,
            height: AppDimensions.height60,
            color: Theme.of(context).primaryColor,
            icon: AppIconWidget(
              iconPath: AppAssets.teacherIcon,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.onPrimary
                  : AppColors.darkOnPrimary,
            ),
            onPressed: () {
              controller.on(
                event: MainLoginUiEvent.toTeacherLogin(),
              );
            },
          ),
        ],
      ),
    );
  }
}
