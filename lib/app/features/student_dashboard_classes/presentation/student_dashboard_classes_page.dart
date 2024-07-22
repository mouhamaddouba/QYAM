import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/widgets/views/student_dashboard_classes_list_view.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/widgets/views/student_dashboard_classes_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/widgets/views/student_dashboard_classes_list_days_view.dart';

class StudentDashboardClassesPage
    extends GetView<StudentDashboardClassesController> {
  const StudentDashboardClassesPage({
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
                const StudentDashboardClassesAppBarView(),

                // List view of day
                const StudentDashboardClassesListDaysView(),

                controller.state().isLoading &&
                        controller.state().dayClasses.isEmpty

                    // Loading
                    ? const Expanded(
                        child: Center(
                          child: AppLoadingWidget(),
                        ),
                      )

                    // Body classes
                    : Expanded(
                        // List or no data found
                        child: controller.state().dayClasses.isEmpty
                            ? controller.state().isLoading
                                ? const SizedBox.shrink()

                                // If we don't have data or When i have error
                                : Expanded(
                                    child: AppNoDataFoundWidget(
                                      title: AppStrings.noClasses.tr,
                                    ),
                                  )

                            // List Of classes
                            : const StudentDashboardClassesListView(),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
