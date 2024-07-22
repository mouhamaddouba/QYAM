import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/student_login_controller.dart';

class StudentLoginHeaderAnimationView extends GetView<StudentLoginController> {
  final Widget child;

  const StudentLoginHeaderAnimationView({
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
              ? AppDimensions.zero - AppConstants.headerPositionTop.w
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
                  AppDimensions.radius18,
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
