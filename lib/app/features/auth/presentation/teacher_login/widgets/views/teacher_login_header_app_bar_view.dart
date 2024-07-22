import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/teacher_login_controller.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/ui/teacher_login_ui_event.dart';

class TeacherLoginHeaderAppBarView extends GetView<TeacherLoginController> {
  const TeacherLoginHeaderAppBarView({
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
          // Icon back
          AppIconWidget(
            containerColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.onPrimary
                : AppColors.darkOnPrimary,
            iconData: Icons.arrow_back_ios_rounded,
            color: Theme.of(context).primaryColor,
            withBackground: true,
            backgroundRadius: AppDimensions.radius10,
            backgroundSize: AppDimensions.iconSize40,
            size: AppDimensions.iconSize30,
            onTap: () {
              controller.on(
                event: TeacherLoginUiEvent.backtoLoginMain(),
              );
            },
          ),

          // Text App bar
          Column(
            children: [
              // Text appbar arabic
              AppTextWidget(
                AppStrings.arabicCollageName.tr,
                textStyle: Theme.of(context).textTheme.titleMedium,
                textColor: Theme.of(context).brightness == Brightness.light
                    ? AppColors.onPrimary
                    : AppColors.darkOnPrimary,
              ),

              // Space
              const SizedBox(
                height: AppDimensions.paddingOrMargin8,
              ),

              // Text appbar arabic
              AppTextWidget(
                AppStrings.englishCollageName.tr,
                textStyle: Theme.of(context).textTheme.titleMedium,
                textColor: Theme.of(context).brightness == Brightness.light
                    ? AppColors.onPrimary
                    : AppColors.darkOnPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
