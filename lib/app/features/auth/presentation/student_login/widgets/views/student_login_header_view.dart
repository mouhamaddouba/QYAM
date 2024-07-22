import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/student_login_controller.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/widgets/views/student_login_header_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/widgets/views/student_login_header_animation_view.dart';

class StudentLoginHeaderView extends GetView<StudentLoginController> {
  const StudentLoginHeaderView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppDimensions.flexExpand04,
      child: Stack(
        children: [
          // Header container with animation
          StudentLoginHeaderAnimationView(
            child: Column(
              children: const [
                // Space
                SizedBox(
                  height: AppDimensions.paddingOrMargin50,
                ),

                // Top appbar
                StudentLoginHeaderAppBarView(),

                // Space
                SizedBox(
                  height: AppDimensions.paddingOrMargin32,
                ),

                // Image
                Expanded(
                  child: AppImageWidget(
                    path: AppAssets.student,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
