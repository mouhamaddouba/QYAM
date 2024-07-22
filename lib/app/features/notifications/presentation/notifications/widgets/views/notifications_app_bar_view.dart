import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/notifications_controller.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/ui/notifications_ui_event.dart';

class NotificationsAppBarView extends GetView<NotificationsController> {
  const NotificationsAppBarView({
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
        top: AppDimensions.paddingOrMargin10,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back to classes
            AppIconWidget(
              withBackground: true,
              iconData: Icons.arrow_back_ios_rounded,
              backgroundColor: AppColors.surfaceVariant,
              backgroundSize: AppDimensions.iconSize40,
              backgroundRadius: AppDimensions.radius10,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.primary
                  : AppColors.onPrimary,
              onTap: () {
                controller.on(
                  event: NotificationsUiEvent.backtoClassesPage(),
                );
              },
            ),

            // Text App bar
            AppTextWidget(
              AppStrings.notification.tr,
              fontSize: AppDimensions.fontSize12,
              textColor: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),

            // Profile icon
            AppIconWidget(
              withBackground: true,
              iconData: Icons.logout,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.primary
                  : AppColors.onPrimary,
              backgroundColor: AppColors.surface,
              backgroundSize: AppConstants.backgroundSize,
              backgroundRadius: AppDimensions.radius10,
              onTap: () {
                controller.on(
                  event: NotificationsUiEvent.logout(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
