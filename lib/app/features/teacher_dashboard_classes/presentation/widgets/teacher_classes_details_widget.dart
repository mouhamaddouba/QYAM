import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_controller.dart';

class TeacherClassesDetailsWidget
    extends GetView<StudentDashboardClassesController> {
  final String iconPath;
  final String title;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;

  const TeacherClassesDetailsWidget({
    Key? key,
    required this.iconPath,
    required this.title,
    this.color,
    this.fontsize,
    this.fontWeight,
    this.textStyle,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          // Icon
          AppIconWidget(
            iconPath: iconPath,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.outline
                : AppColors.darkOutline,
            size: AppDimensions.iconSize20,
          ),

          // Space
          const SizedBox(
            width: AppDimensions.paddingOrMargin8,
          ),

          // Title
          AppTextWidget(
            title,
            textStyle: textStyle,
          ),
        ],
      ),
    );
  }
}
