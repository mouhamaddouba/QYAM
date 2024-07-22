import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/notifications_controller.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/widgets/views/notifications_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/widgets/views/notifications_list_view.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

class NotificationsPage extends GetView<NotificationsController> {
  const NotificationsPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App bar
                const NotificationsAppBarView(),

                controller.state().isLoading &&
                        controller.state().notifications.isEmpty

                    // Loading
                    ? const Expanded(
                        child: Center(
                          child: AppLoadingWidget(),
                        ),
                      )

                    // Body notifications
                    : Expanded(
                        // List or no data found
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: AppDimensions.paddingOrMargin16,
                            ),
                            controller.state().notifications.isEmpty
                                ? controller.state().isLoading
                                    ? const SizedBox.shrink()

                                    // If we don't have data or When i have error
                                    : AppNoDataFoundWidget(
                                        title: AppStrings.noNotification.tr,
                                      )

                                // List Of notifications
                                : const NotificationsListView(),
                          ],
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
