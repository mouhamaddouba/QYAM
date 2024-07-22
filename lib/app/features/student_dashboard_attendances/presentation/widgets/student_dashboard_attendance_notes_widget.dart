import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/student_dashboard_attendances_controller.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

class StudentDashboardAttendanceNoteWidget
    extends GetView<StudentDashboardAttendancesController> {
  const StudentDashboardAttendanceNoteWidget({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppDimensions.paddingOrMargin6,
            vertical: AppDimensions.paddingOrMargin16,
          ),
          child: Stack(
            children: [
              //Notes Constant
              if (controller.state().selectDate != null)
                controller.state().note.isEmpty
                    ? AppNoDataFoundWidget(
                        title: AppStrings.noNots.tr,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title note
                          AppTextWidget(
                            textAlign: TextAlign.start,
                            AppStrings.notes.tr,
                            textStyle:
                                Theme.of(context).textTheme.displayMedium,
                          ),

                          // Title note from api
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppDimensions.paddingOrMargin8,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: AppTextWidget(
                                    controller.state().note,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
            ],
          ),
        );
      },
    );
  }
}
