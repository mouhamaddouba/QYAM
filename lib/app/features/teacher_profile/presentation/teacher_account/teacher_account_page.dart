import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/teacher_account_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/widgets/views/teacher_account_form_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/widgets/views/teacher_account_header_view.dart';

class TeacherAccountPage extends GetView<TeacherAccountController> {
  const TeacherAccountPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: const [
            // Header
            TeacherAccountHeaderView(),

            // Form
            TeacherAccountFormView()
          ],
        ),
      ),
    );
  }
}
