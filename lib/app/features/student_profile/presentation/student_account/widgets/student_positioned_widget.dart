import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_controller.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';

class StudentAccountPositionedWidget extends GetView<StudentAccountController> {
  final double positionBottom;
  final double? positionStart;
  final double? positionEnd;
  final IconData iconData;
  final Color containerColor;

  final void Function() onTap;

  const StudentAccountPositionedWidget({
    Key? key,
    required this.positionBottom,
    this.positionStart,
    this.positionEnd,
    required this.iconData,
    required this.containerColor,
    required this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: positionBottom,
      start: positionStart,
      end: positionEnd,
      child: AppIconWidget(
        withBackground: true,
        backgroundSize: AppDimensions.iconSize32,
        size: AppDimensions.iconSize20,
        color: AppColors.whiteBlue,
        containerRadius: AppDimensions.radius15,
        containerColor: containerColor,
        iconData: iconData,
        onTap: onTap,
      ),
    );
  }
}
