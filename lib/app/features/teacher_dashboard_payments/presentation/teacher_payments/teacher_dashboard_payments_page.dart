import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/teacher_dashboard_payments_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/widgets/views/teacher_dashboard_payments_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/widgets/views/teacher_dashboard_payments_list_view.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

class TeacherDashboardPaymentsPage
    extends GetView<TeacherDashboardPaymentsController> {
  const TeacherDashboardPaymentsPage({
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
                const TeacherDashboardPaymentsAppBarView(),

                controller.state().isLoading &&
                        controller.state().teacherPayments.isEmpty

                    // Loading
                    ? const Expanded(
                        child: Center(
                          child: AppLoadingWidget(),
                        ),
                      )

                    // Body Payments
                    : Expanded(
                        // List or no data found
                        child: controller.state().teacherPayments.isEmpty
                            ? controller.state().isLoading
                                ? const SizedBox.shrink()

                                // If we don't have data or When i have error
                                : Expanded(
                                    child: AppNoDataFoundWidget(
                                      title: AppStrings.noPayments.tr,
                                    ),
                                  )

                            // List Of Payments
                            : const TeacherDashboardPaymentsListView(),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
