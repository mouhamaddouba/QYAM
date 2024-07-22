import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/ui/student_dashboard_classes_ui_event.dart';

class StudentDashboardClassesAppBarView
    extends GetView<StudentDashboardClassesController> {
  const StudentDashboardClassesAppBarView({
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
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            AppImageWidget(
              path: Theme.of(context).brightness == Brightness.light
                  ? AppAssets.logo
                  : AppAssets.logoWhite,
              height: Theme.of(context).brightness == Brightness.light
                  ? AppDimensions.paddingOrMargin60
                  : AppDimensions.paddingOrMargin55,
            ),

            // Icons
            Row(
              children: [
                // Notification icon
                AppIconWidget(
                  withBackground: true,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.primary
                      : AppColors.onPrimary,
                  iconPath: AppAssets.notification,
                  backgroundSize: AppConstants.backgroundSize,
                  backgroundRadius: AppDimensions.radius10,
                  onTap: () {
                    controller.on(
                      event: StudentDashboardClassesUiEvent.toNotification(),
                    );
                  },
                ),

                // Space
                const SizedBox(
                  width: AppDimensions.paddingOrMargin8,
                ),

                // Profile icon
                AppIconWidget(
                  withBackground: true,
                  iconPath: AppAssets.profile,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.primary
                      : AppColors.onPrimary,
                  backgroundColor: AppColors.surfaceVariant,
                  backgroundSize: AppConstants.backgroundSize,
                  backgroundRadius: AppDimensions.radius10,
                  onTap: () {
                    controller.on(
                      event: StudentDashboardClassesUiEvent.toProfile(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
