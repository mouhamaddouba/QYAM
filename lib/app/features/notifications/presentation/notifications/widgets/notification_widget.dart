import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/extensions/string_extensions.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/notifications_controller.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class NotificationWidget extends GetView<NotificationsController> {
  final NotificationsData notificationsData;
  final void Function(NotificationsData) onTap;

  const NotificationWidget({
    Key? key,
    required this.notificationsData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin16,
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
        child: InkWell(
          child: AppListTileWidget(
            textTitle: notificationsData.title.trimLength(15),
            titleColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.onPrimaryContainer
                : AppColors.darkOnPrimaryContainer,
            dateColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.gray03
                : AppColors.white01,
            textSubtitle: notificationsData.content.trimLength(35),
            dateTimeTitle: notificationsData.addDate,
            imageData: notificationsData.image.isEmpty
                ? Theme.of(context).brightness == Brightness.light
                    ? AppAssets.logo
                    : AppAssets.logoWhite
                : AppUrls.baseUrl + notificationsData.image,
            fit:
                notificationsData.image.isEmpty ? BoxFit.contain : BoxFit.cover,
            paddingHorizontalTitle: AppDimensions.paddingOrMargin16,
            paddingListTile: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingOrMargin16,
            ),
            isListView: true,
            isProfile: true,
            isTitleProfile: true,
            dateWeight: FontWeight.w400,
            dateSize: AppDimensions.fontSize06,
            heightNotifications: AppDimensions.height01,
          ),
          onTap: () {
            onTap(notificationsData);
          },
        ),
      ),
    );
  }
}
