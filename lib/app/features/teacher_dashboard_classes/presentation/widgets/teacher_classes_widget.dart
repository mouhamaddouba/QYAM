import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/entities/teacher_classes.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/teacher_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/widgets/teacher_classes_details_widget.dart';

class TeacherClassesWidget extends GetView<TeacherDashboardClassesController> {
  final TeacherClasses classes;

  const TeacherClassesWidget({
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

                  // Time class
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
                    TeacherClassesDetailsWidget(
                      iconPath: AppAssets.subject,
                      title: classes.subjectName,
                      textStyle: Theme.of(context).textTheme.titleSmall,
                    ),

                    // Space
                    const SizedBox(
                      height: AppDimensions.paddingOrMargin8,
                    ),

                    // Name Group
                    TeacherClassesDetailsWidget(
                      iconPath: AppAssets.group,
                      title: classes.groupFullName,
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
