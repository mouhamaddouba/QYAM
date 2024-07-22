import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/teacher_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/widgets/views/teacher_dashboard_classes_list_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/widgets/views/teacher_dashboard_classes_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/widgets/views/teacher_dashboard_classes_list_days_view.dart';

class TeacherDashboardClassesPage
    extends GetView<TeacherDashboardClassesController> {
  const TeacherDashboardClassesPage({
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
                const TeacherDashboardClassesAppBarView(),

                // List view of day
                const TeacherDashboardClassesListDaysView(),

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
                            : const TeacherDashboardClassesListView(),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
