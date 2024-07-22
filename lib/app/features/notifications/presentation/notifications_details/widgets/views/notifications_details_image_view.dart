import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/notifications_details_controller.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';

class NotificationsDetailsImageView
    extends GetView<NotificationsDetailsController> {
  final NotificationsData notificationData;

  const NotificationsDetailsImageView({
    required this.notificationData,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // Animation for form
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.paddingOrMargin8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.onPrimary
              : AppColors.darkOnPrimary,
          borderRadius: BorderRadius.circular(
            AppDimensions.radius10,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.surfaceVariant
                  : AppColors.gray03.withOpacity(0.1),
              blurRadius: AppDimensions.radius08,
              offset: Offset.zero,
            ),
          ],
        ),
        child: AppImageWidget(
          path: notificationData.image.isEmpty
              ? Theme.of(context).brightness == Brightness.light
                  ? AppAssets.logo
                  : AppAssets.logoWhite
              : AppUrls.baseUrl + notificationData.image,
          // width: AppDimensions.width180,
          // height: AppDimensions.height180,
        ),
      ),
    );
  }
}
