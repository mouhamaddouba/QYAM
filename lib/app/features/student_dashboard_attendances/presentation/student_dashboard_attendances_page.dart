import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/widgets/views/student_dashboard_attendances_appbar_view.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/student_dashboard_attendances_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/widgets/student_dashboard_attendance_notes_widget.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/widgets/views/student_dashboard_attendances_calender_view.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

class StudentDashboardAttendancesPage
    extends GetView<StudentDashboardAttendancesController> {
  const StudentDashboardAttendancesPage({
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
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppDimensions.paddingOrMargin16,
              ),
              child: Column(
                children: [
                  // App bar
                  const StudentDashboardAttendancesAppBarView(),

                  // Calender
                  const StudentDashboardAttendancesCalenderView(),

                  controller.state().isLoading &&
                          controller.state().attendances.isEmpty

                      // Loading
                      ? const Expanded(
                          child: Center(
                            child: AppLoadingWidget(),
                          ),
                        )

                      // Notes
                      : Expanded(
                          // List or no data found
                          child: controller.state().attendances.isEmpty
                              ? controller.state().isLoading
                                  ? const SizedBox.shrink()

                                  // If we don't have data or When i have error
                                  : Expanded(
                                      child: AppNoDataFoundWidget(
                                        title: AppStrings.noNots.tr,
                                      ),
                                    )

                              // Note
                              : const StudentDashboardAttendanceNoteWidget(),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
