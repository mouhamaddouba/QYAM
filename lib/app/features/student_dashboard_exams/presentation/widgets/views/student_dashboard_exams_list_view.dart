import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/ui/student_dashboard_exams_ui_event.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/widgets/student_exams_widget.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/student_dashboard_exams_controller.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardExamsListView
    extends GetView<StudentDashboardExamsController> {
  const StudentDashboardExamsListView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          return SwipeRefresh.material(
            indicatorColor: Theme.of(context).primaryColor,
            stateStream: controller.state().swipeController.stream,
            onRefresh: () {
              controller.on(
                event: StudentDashboardExamsUiEvent.refresh(),
              );
            },
            children: [
              ListView.separated(
                // Padding list
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingOrMargin16,
                  vertical: AppDimensions.paddingOrMargin8,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                controller: controller.state().scrollController,
                itemCount: controller.state().exmas.length +
                    (controller.state().isLoading ||
                            controller.state().pagedList.nextPage == -1
                        ? 1
                        : 0),

                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  if (controller.state().isLoading &&
                      controller.state().exmas.length == index) {
                    return const Center(
                      child: AppLoadingWidget(),
                    );
                  }

                  // If we dont have data more
                  if (controller.state().pagedList.nextPage == -1 &&
                      index == controller.state().exmas.length) {
                    return const SizedBox.shrink();
                  }

                  // Exams card
                  return StudentExamWidget(
                    exams: controller.state().exmas[index],
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
        },
      ),
    );
  }
}
