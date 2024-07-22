import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/ui/student_profile_ui_event.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';

class StudentProfilAppBarView extends GetView<StudentProfileController> {
  const StudentProfilAppBarView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: AppDimensions.paddingOrMargin16,
        end: AppDimensions.paddingOrMargin16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Button back to dashboard
          AppIconWidget(
            iconData: Icons.arrow_back_ios_rounded,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.primary
                : AppColors.onPrimary,
            withBackground: true,
            backgroundRadius: AppDimensions.radius10,
            backgroundSize: AppDimensions.iconSize40,
            onTap: () {
              controller.on(
                event: StudentProfileUiEvent.backtoDashboard(),
              );
            },
          ),

          // Logo
          AppImageWidget(
            path: Theme.of(context).brightness == Brightness.light
                ? AppAssets.logo
                : AppAssets.logoWhite,
            height: Theme.of(context).brightness == Brightness.light
                ? AppDimensions.paddingOrMargin60
                : AppDimensions.paddingOrMargin55,
          ),

          // Button login
          AppIconWidget(
            withBackground: true,
            iconPath: AppAssets.notification,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.primary
                : AppColors.onPrimary,
            backgroundRadius: AppDimensions.radius10,
            backgroundSize: AppDimensions.iconSize40,
            onTap: () {
              controller.on(
                event: StudentProfileUiEvent.toNotification(),
              );
            },
          ),
        ],
      ),
    );
  }
}
