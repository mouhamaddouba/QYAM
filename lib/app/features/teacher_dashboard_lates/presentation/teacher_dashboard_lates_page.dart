import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/teacher_dashboard_lates_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/widgets/views/teacher_dashboard_lates_list_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/widgets/views/teacher_dashboard_lates_app_bar_view.dart';

class TeacherDashboardLatesPage
    extends GetView<TeacherDashboardLatesController> {
  const TeacherDashboardLatesPage({
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
                const TeacherDashboardLatesAppBarView(),

                controller.state().isLoading && controller.state().lates.isEmpty

                    // Loading
                    ? const Expanded(
                        child: Center(
                          child: AppLoadingWidget(),
                        ),
                      )

                    // Body lates
                    : Expanded(
                        // List or no data found
                        child: controller.state().lates.isEmpty
                            ? controller.state().isLoading
                                ? const SizedBox.shrink()

                                // If we don't have data or When i have error
                                : Expanded(
                                    child: AppNoDataFoundWidget(
                                      title: AppStrings.noLates.tr,
                                    ),
                                  )

                            // List Of Lates
                            : const TeacherDashboardLatesListView(),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
