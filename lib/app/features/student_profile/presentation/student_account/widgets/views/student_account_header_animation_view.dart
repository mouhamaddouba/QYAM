import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_controller.dart';

class StudentAccountHeaderAnimationView
    extends GetView<StudentAccountController> {
  final Widget child;

  const StudentAccountHeaderAnimationView({
    Key? key,
    required this.child,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
