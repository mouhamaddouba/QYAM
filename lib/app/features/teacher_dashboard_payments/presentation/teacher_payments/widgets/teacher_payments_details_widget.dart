import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/teacher_dashboard_payments_controller.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';

class TeacherPaymentDetailsWidget
    extends GetView<TeacherDashboardPaymentsController> {
  final String iconPath;
  final String title;
  final Color? apiTitleColor;
  final double? apiFontSize;
  final FontWeight? apiFontWeight;
  final bool isNotesRow;
  final TextStyle? textStyle;

  const TeacherPaymentDetailsWidget({
    Key? key,
    required this.iconPath,
    required this.title,
    this.apiTitleColor,
    this.apiFontSize,
    this.apiFontWeight,
    this.textStyle,
    this.isNotesRow = false,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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

          // Title from Api
          AppTextWidget(
            title,
            textStyle: textStyle,
          ),

          // Check row
          isNotesRow

              // If row payments
              ? const SizedBox.shrink()

              // If row notes
              : Row(
                  children: [
                    // Space
                    const SizedBox(
                      width: AppDimensions.paddingOrMargin8,
                    ),

                    // SP
                    AppTextWidget(
                      AppStrings.sp.tr,
                      textStyle: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
