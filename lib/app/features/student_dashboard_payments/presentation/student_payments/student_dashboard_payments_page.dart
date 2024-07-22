import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/student_dashboard_payments_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/widgets/views/student_dashboard_payments_list_view.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/widgets/views/student_dashboard_payments_app_bar_view.dart';

class StudentDashboardPaymentsPage
    extends GetView<StudentDashboardPaymentsController> {
  const StudentDashboardPaymentsPage({
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
                const StudentDashboardPaymentsAppBarView(),

                controller.state().isLoading &&
                        controller.state().studentPayments.isEmpty

                    // Loading
                    ? const Expanded(
                        child: Center(
                          child: AppLoadingWidget(),
                        ),
                      )

                    // Body Payments
                    : Expanded(
                        // List or no data found
                        child: controller.state().studentPayments.isEmpty
                            ? controller.state().isLoading
                                ? const SizedBox.shrink()

                                // If we don't have data or When i have error
                                : Expanded(
                                    child: AppNoDataFoundWidget(
                                      title: AppStrings.noPayments.tr,
                                    ),
                                  )

                            // List Of Payments
                            : const StudentDashboardPaymentListView(),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
