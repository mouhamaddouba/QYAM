import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/student_dashboard_attendances_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/ui/student_dashboard_attendances_ui_event.dart';

class StudentDashboardAttendancesAppBarView
    extends GetView<StudentDashboardAttendancesController> {
  const StudentDashboardAttendancesAppBarView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
          Row(
            children: [
              // Notification icon
              AppIconWidget(
                withBackground: true,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.primary
                    : AppColors.onPrimary,
                iconPath: AppAssets.notification,
                backgroundColor: AppColors.secondaryContainer,
                backgroundSize: AppConstants.backgroundSize,
                backgroundRadius: AppDimensions.radius10,
                onTap: () {
                  controller.on(
                    event: StudentDashboardAttendancesUiEvent.toNotification(),
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
                    event: StudentDashboardAttendancesUiEvent.toProfile(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
