import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/teacher_profile_controller.dart';

class TeacherProfileListStyleView extends GetView<TeacherProfileController> {
  final Widget child;

  const TeacherProfileListStyleView({
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
                  : AppColors.gray03.withOpacity(
                      AppConstants.opacity_01,
                    ),
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
