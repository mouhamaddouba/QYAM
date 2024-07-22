import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/entities/student_classes.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/widgets/student_class_detail_widget.dart';

class StudentClassesWidget extends GetView<StudentDashboardClassesController> {
  final StudentClasses classes;

  const StudentClassesWidget({
    Key? key,
    required this.classes,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          AppDimensions.radius10,
        ),
      ),
      child: SizedBox(
        height: AppDimensions.height85,
        child: Row(
          children: [
            // The Primary section of the card
            Expanded(
              flex: AppDimensions.flexExpand02,
              child: ColoredBox(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: AppDimensions.paddingOrMargin16,
                  ),

                  // Time class with icon
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon
                      AppIconWidget(
                        iconPath: AppAssets.clock,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.onPrimary
                            : AppColors.darkOnPrimary,
                        size: AppDimensions.iconSize24,
                      ),

                      // Space
                      const SizedBox(
                        height: AppDimensions.paddingOrMargin8,
                      ),

                      // Time class
                      AppTextWidget(
                        classes.duration,
                        textAlign: TextAlign.center,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // The white section of the card
            Expanded(
              flex: AppDimensions.flexExpand05,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppDimensions.paddingOrMargin16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Name Subject
                    StudentClassDetailWidget(
                      iconPath: AppAssets.subject,
                      title: classes.subjectName,
                      textStyle: Theme.of(context).textTheme.titleSmall,
                    ),

                    // Space
                    const SizedBox(
                      height: AppDimensions.paddingOrMargin8,
                    ),

                    // Name teacher
                    StudentClassDetailWidget(
                      iconPath: AppAssets.teacherIcon,
                      title: classes.teacherName,
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
