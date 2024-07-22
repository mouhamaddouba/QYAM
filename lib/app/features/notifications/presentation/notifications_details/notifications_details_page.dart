import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/widgets/views/notifications_details_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/widgets/views/notifications_details_view.dart';

import 'notifications_details_controller.dart';

class NotificationsDetailsPage extends GetView<NotificationsDetailsController> {
  const NotificationsDetailsPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar
            NotificationsDetailsAppBarView(
              notificationData: controller.state().notificationsData!,
            ),

            SizedBox(
              height: AppDimensions.paddingOrMargin32,
            ),

            // Body details
            NotificationsDetailsView(
              notificationData: controller.state().notificationsData!,
            )
          ],
        ),
      ),
    );
  }
}
