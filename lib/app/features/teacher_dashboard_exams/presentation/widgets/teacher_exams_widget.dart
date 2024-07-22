import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/entities/teacher_exams.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/teacher_dashboard_exams_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/widgets/teacher_exams_details_widget.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

class TeacherExamWidget extends GetView<TeacherDashboardExamsController> {
  final TeacherExams exams;

  const TeacherExamWidget({
    Key? key,
    required this.exams,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.radius10,
        ),
      ),
      child: SizedBox(
        height: AppDimensions.height120.h,
        child: Row(
          children: [
            // The Primary section of the card

            Expanded(
              flex: AppDimensions.flexExpand01,
              child: ColoredBox(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingOrMargin16,
                  ),

                  // Type exam and mark
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Type exam
                      AppTextWidget(
                        exams.type.capitalizeFirst ?? exams.type,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        isAutoSized: true,
                      ),

                      // Space
                      const SizedBox(
                        height: AppDimensions.paddingOrMargin16,
                      ),

                      // Mark
                      Column(
                        children: [
                          // Mark
                          AppTextWidget(
                            exams.grade.toString(),
                            textStyle: Theme.of(context).textTheme.titleMedium,
                            isAutoSized: true,
                          ),

                          // Divider
                          Divider(
                            thickness: AppDimensions.thickness_18,
                            indent: AppConstants.indent15,
                            endIndent: AppConstants.endIndent15,
                            color: Theme.of(context).cardColor,
                          ),

                          // Max mark
                          AppTextWidget(
                            exams.maxMark.toString(),
                            textStyle: Theme.of(context).textTheme.titleMedium,
                            isAutoSized: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // The white section of the card

            Expanded(
              flex: AppDimensions.flexExpand02,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppDimensions.paddingOrMargin16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Date exams
                    TeacherExamsDetailsWidget(
                      iconPath: AppAssets.calendar,
                      title: DateFormat("yyyy/MM/dd").format(exams.dateAndTime),
                      textStyle: Theme.of(context).textTheme.displayMedium,
                    ),

                    // Space
                    const SizedBox(
                      height: AppDimensions.paddingOrMargin8,
                    ),

                    // Name exams
                    TeacherExamsDetailsWidget(
                      iconPath: AppAssets.subject,
                      title: exams.subjectName,
                      textStyle: Theme.of(context).textTheme.displaySmall,
                    ),

                    // Space
                    const SizedBox(
                      height: AppDimensions.paddingOrMargin8,
                    ),

                    // Day of exams
                    TeacherExamsDetailsWidget(
                      iconPath: AppAssets.day,
                      title: DateFormat("EEEE", "ar").format(exams.dateAndTime),
                      textStyle: Theme.of(context).textTheme.displaySmall,
                    ),

                    // Space
                    const SizedBox(
                      height: AppDimensions.paddingOrMargin8,
                    ),

                    // Hour of exams
                    TeacherExamsDetailsWidget(
                      iconPath: AppAssets.clock,
                      title: DateFormat("hh:mm aa", "ar")
                          .format(exams.dateAndTime),
                      textStyle: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
