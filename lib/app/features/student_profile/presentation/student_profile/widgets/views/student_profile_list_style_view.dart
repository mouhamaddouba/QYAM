import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_controller.dart';

class StudentProfileListStyleView extends GetView<StudentProfileController> {
  final Widget child;

  const StudentProfileListStyleView({
    Key? key,
    required this.child,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // Animation for form
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin16,
        vertical: AppDimensions.paddingOrMargin8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.onPrimary
              : AppColors.darkOnPrimary,
          borderRadius: BorderRadius.circular(
            AppDimensions.radius10,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.surfaceVariant
                  : AppColors.gray03.withOpacity(0.1),
              blurRadius: AppDimensions.radius08,
              offset: Offset.zero,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
