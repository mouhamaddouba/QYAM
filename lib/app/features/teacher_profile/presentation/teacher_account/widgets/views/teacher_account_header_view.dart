import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/teacher_account_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/widgets/views/teacher_account_header_animation_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/widgets/views/teacher_account_header_app_bar.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/widgets/views/teacher_account_image_view.dart';

class TeacherAccountHeaderView extends GetView<TeacherAccountController> {
  const TeacherAccountHeaderView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppDimensions.flexExpand02,
      child: Stack(
        children: [
          // Header container with animation
          TeacherAccountHeaderAnimationView(
            child: Column(
              children: const [
                // Space
                SizedBox(
                  height: AppDimensions.paddingOrMargin50,
                ),

                // Top appbar
                TeacherAccountHeaderAppBarView(),

                //Space
                SizedBox(
                  height: AppDimensions.paddingOrMargin16,
                ),

                // Image user
                TeacherAccountImageView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
