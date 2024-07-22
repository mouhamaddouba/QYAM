import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';

import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/notifications_details_controller.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/widgets/views/notifications_details_image_view.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

class NotificationsDetailsView extends GetView<NotificationsDetailsController> {
  final NotificationsData notificationData;

  const NotificationsDetailsView({
    required this.notificationData,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          bottom: AppDimensions.paddingOrMargin20,
          start: AppDimensions.paddingOrMargin16,
          end: AppDimensions.paddingOrMargin16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              AppTextWidget(
                notificationData.title,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),

              //space
              SizedBox(
                height: AppDimensions.paddingOrMargin8,
              ),

              //content
              AppTextWidget(
                notificationData.content,
                textStyle: Theme.of(context).textTheme.headlineMedium,
              ),

              //space
              SizedBox(
                height: AppDimensions.paddingOrMargin16,
              ),

              //Image
              NotificationsDetailsImageView(
                notificationData: controller.state().notificationsData!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
