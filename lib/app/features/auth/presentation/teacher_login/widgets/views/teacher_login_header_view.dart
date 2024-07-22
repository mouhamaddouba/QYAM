import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/teacher_login_controller.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/widgets/views/teacher_login_header_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/widgets/views/teacher_login_header_animation_view.dart';

class TeacherLoginHeaderView extends GetView<TeacherLoginController> {
  const TeacherLoginHeaderView({
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
          // Animation for header
          TeacherLoginHeaderAnimationView(
            child: Column(
              children: const [
                // Space
                SizedBox(
                  height: AppDimensions.paddingOrMargin50,
                ),

                // Top appbar
                TeacherLoginHeaderAppBarView(),

                // Space
                SizedBox(
                  height: AppDimensions.paddingOrMargin32,
                ),

                // Image
                Expanded(
                  child: AppImageWidget(
                    path: AppAssets.teacher,
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
