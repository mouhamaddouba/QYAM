import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';

import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/notifications_details_controller.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

import 'package:intl/intl.dart' as date;

class NotificationsDetailsAppBarView
    extends GetView<NotificationsDetailsController> {
  final NotificationsData notificationData;

  const NotificationsDetailsAppBarView({
    required this.notificationData,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextWidget(
                notificationData.senderName.isEmpty
                    ? AppStrings.unKnowSender.tr
                    : notificationData.senderName,
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: AppDimensions.paddingOrMargin10,
              ),
              AppTextWidget(
                notificationData.senderEmail.isEmpty
                    ? AppStrings.unKnowEmail.tr
                    : notificationData.senderEmail,
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppTextWidget(
                date.DateFormat.EEEE().format(
                  notificationData.addDate,
                ),
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: AppDimensions.paddingOrMargin4,
              ),
              AppTextWidget(
                date.DateFormat('yyyy/MM/dd').format(
                  notificationData.addDate,
                ),
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: AppDimensions.paddingOrMargin4,
              ),
              AppTextWidget(
                date.DateFormat('hh:mm aa').format(
                  notificationData.addDate,
                ),
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),

          // Text App bar
        ],
      ),
    );
  }
}
