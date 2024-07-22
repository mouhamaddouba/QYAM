import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard/presentation/student_dashboard_controller.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_bottom_bar_widget.dart';

class StudentDashboardTabBarView extends GetView<StudentDashboardController> {
  const StudentDashboardTabBarView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.surfaceVariant
                    : AppColors.gray03,
                offset: Offset(
                  AppDimensions.zero,
                  AppDimensions.zero,
                ),
                spreadRadius: AppDimensions.zero,
                blurRadius: AppConstants.blur03,
              ),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                AppDimensions.radius16,
              ),
            ),
          ),
          height: AppDimensions.height60,
          child: AppBottomBarWidget(
            items: controller.state().items,
            selectedIndex: controller.state().selectedIndex,
            onTap: (int index) {
              controller.state(
                controller.state().copyWith(
                      selectedIndex: index,
                    ),
              );
            },
            isBottomIndicator: false,
          ),
        );
      },
    );
  }
}
