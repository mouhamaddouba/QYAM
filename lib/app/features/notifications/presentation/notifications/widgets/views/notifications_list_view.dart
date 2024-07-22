import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/notifications_controller.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/ui/notifications_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/widgets/notification_widget.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class NotificationsListView extends GetView<NotificationsController> {
  const NotificationsListView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SwipeRefresh.material(
        indicatorColor: AppColors.primary,
        stateStream: controller.state().swipeController.stream,
        onRefresh: () {
          controller.on(
            event: NotificationsUiEvent.refresh(),
          );
        },
        children: [
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            controller: controller.state().scrollController,
            itemCount: controller.state().notifications.length +
                (controller.state().isLoading ||
                        controller.state().pagedList.nextPage == -1
                    ? 1
                    : 0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (controller.state().isLoading &&
                  index == controller.state().notifications.length) {
                return const Center(
                  child: AppLoadingWidget(),
                );
              }

              // If we dont have data more
              if (controller.state().pagedList.nextPage == -1 &&
                  index == controller.state().notifications.length) {
                return const SizedBox.shrink();
              }

              //padding for last item in listview
              if (index == controller.state().notifications.length - 1) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppDimensions.paddingOrMargin20,
                  ),
                  child: NotificationWidget(
                    notificationsData: controller.state().notifications[index],
                    onTap: (NotificationsData notificationsData) {
                      controller.on(
                        event: NotificationsUiEvent.toNotificationsDetails(
                          notificationsData: notificationsData,
                        ),
                      );
                    },
                  ),
                );
              }

              // Notification card
              return NotificationWidget(
                notificationsData: controller.state().notifications[index],
                onTap: (NotificationsData notificationsData) {
                  controller.on(
                    event: NotificationsUiEvent.toNotificationsDetails(
                      notificationsData: notificationsData,
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: AppDimensions.paddingOrMargin8,
              );
            },
          ),
        ],
      ),
    );
  }
}
