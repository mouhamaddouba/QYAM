import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/ui/student_dashboard_exams_ui_event.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/student_dashboard_exams_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/widgets/views/student_dashboard_exam_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/widgets/views/student_dashboard_exams_list_view.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/widgets/views/student_dashboard_exams_tabs_view.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardExamsPage
    extends GetView<StudentDashboardExamsController> {
  const StudentDashboardExamsPage({
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
              children: [
                // App bar
                const StudentDashboardExamsAppBarView(),

                // Tabs
                const StudentDashboardExamsTabsView(),

                controller.state().isLoading && controller.state().exmas.isEmpty

                    // Loading
                    ? Expanded(
                        child: Center(
                          child: AppLoadingWidget(),
                        ),
                      )

                    // Body exams
                    : Expanded(
                        child: Column(
                          children: [
                            // List or no data found
                            controller.state().exmas.isEmpty
                                ? controller.state().isLoading
                                    ? const SizedBox.shrink()

                                    // If we don't have data or When i have error
                                    : Expanded(
                                        child: SwipeRefresh.material(
                                          indicatorColor:
                                              Theme.of(context).primaryColor,
                                          stateStream: controller
                                              .state()
                                              .swipeController
                                              .stream,
                                          onRefresh: () {
                                            controller.on(
                                              event:
                                                  StudentDashboardExamsUiEvent
                                                      .refresh(),
                                            );
                                          },
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  AppDimensions.height02,
                                              child: AppNoDataFoundWidget(
                                                title: AppStrings.noExam.tr,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                // List Of exams
                                : const StudentDashboardExamsListView(),
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
