import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/teacher_dashboard_lates_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/ui/teacher_dashboard_lates_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/widgets/teacher_lates_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class TeacherDashboardLatesListView
    extends GetView<TeacherDashboardLatesController> {
  const TeacherDashboardLatesListView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SwipeRefresh.material(
      indicatorColor: Theme.of(context).primaryColor,
      stateStream: controller.state().swipeController.stream,
      onRefresh: () {
        controller.on(
          event: TeacherDashboardLatesUiEvent.refresh(),
        );
      },
      children: [
        ListView.separated(
          // Padding list
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppDimensions.paddingOrMargin16,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: controller.state().scrollController,
          itemCount: controller.state().lates.length +
              (controller.state().isLoading ||
                      controller.state().pagedList.nextPage == -1
                  ? 1
                  : 0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (controller.state().isLoading &&
                index == controller.state().lates.length) {
              return const Center(
                child: AppLoadingWidget(),
              );
            }

            // If we dont have data more
            if (controller.state().pagedList.nextPage == -1 &&
                index == controller.state().lates.length) {
              return const SizedBox.shrink();
            }

            // Payment card
            return TeacherLatesWidget(
              lates: controller.state().lates[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: AppDimensions.paddingOrMargin8,
            );
          },
        ),
      ],
    );
  }
}
