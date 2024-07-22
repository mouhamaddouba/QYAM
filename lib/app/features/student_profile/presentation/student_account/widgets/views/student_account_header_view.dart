import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/widgets/views/student_account_header_animation_view.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/widgets/views/student_account_header_app_bar.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/widgets/views/student_account_image_view.dart';

class StudentAccountHeaderView extends GetView<StudentAccountController> {
  const StudentAccountHeaderView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return StudentAccountHeaderAnimationView(
      child: Column(
        children: const [
          // Space
          SizedBox(
            height: AppDimensions.paddingOrMargin50,
          ),

          // Top appbar
          StudentAccountHeaderAppBarView(),

          //Space
          SizedBox(
            height: AppDimensions.paddingOrMargin16,
          ),

          // Image user
          StudentAccountImageView(),

          //Space
          SizedBox(
            height: AppDimensions.paddingOrMargin32,
          ),
        ],
      ),
    );
  }
}
