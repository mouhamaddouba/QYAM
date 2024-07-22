import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';
import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/teacher_account_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/ui/teacher_account_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/widgets/teacher_positioned_widegt.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';

class TeacherAccountImageView extends GetView<TeacherAccountController> {
  const TeacherAccountImageView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image
        AppImageWidget(
          path: AuthUserUtils.image.isEmpty
              ? Theme.of(context).brightness == Brightness.light
                  ? AppAssets.logo
                  : AppAssets.logoWhite
              : AppUrls.baseUrl + AuthUserUtils.image,
          fit: AuthUserUtils.image.isEmpty ? BoxFit.contain : BoxFit.fill,
          width: AppDimensions.width180,
          height: AppDimensions.height180,
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.onPrimary
              : AppColors.darkOnPrimary,
          isCircle: true,
          border: Border.all(
            color: Theme.of(context).focusColor,
          ),
        ),

        // icon camera
        TeacherPositionedWidget(
          positionBottom: AppConstants.bottomPosition09,
          positionStart: AppConstants.startPosition09,
          iconData: Icons.camera_alt,
          containerColor: AppColors.successLight,
          onTap: () {},
        ),

        // icon delete
        TeacherPositionedWidget(
          positionBottom: AppConstants.bottomPosition09,
          positionEnd: AppConstants.endPosition09,
          iconData: Icons.delete,
          containerColor: AppColors.errorLight,
          onTap: () {
            controller.on(
              event: TeacherAccountUiEvent.deleteImage(),
            );
          },
        ),
      ],
    );
  }
}
