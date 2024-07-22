import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/teacher_account_controller.dart';

class TeacherAccountHeaderAnimationView
    extends GetView<TeacherAccountController> {
  final Widget child;

  const TeacherAccountHeaderAnimationView({
    Key? key,
    required this.child,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return AnimatedPositioned(
          duration: const Duration(
            milliseconds: AppConstants.headerLoginDelay,
          ),
          left: AppDimensions.zero,
          right: AppDimensions.zero,
          top: (controller.state().showHeader)
              ? AppDimensions.zero - AppConstants.headerPositionBottom.w
              : AppDimensions.zero,
          bottom: (controller.state().showHeader)
              ? AppConstants.headerPositionBottom.w
              : AppDimensions.zero,
          curve: Curves.fastOutSlowIn,
          child: Container(
            decoration: BoxDecoration(
              gradient: Theme.of(context).brightness == Brightness.light
                  ? AppColors.linearGradient01
                  : AppColors.darkLinearGradient01,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  AppDimensions.radius10,
                ),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
