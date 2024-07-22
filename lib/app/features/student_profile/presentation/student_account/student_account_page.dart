import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/widgets/views/student_account_form_view.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/widgets/views/student_account_header_view.dart';

class StudentAccountPage extends GetView<StudentAccountController> {
  const StudentAccountPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Header
            StudentAccountHeaderView(),

            // Form
            StudentAccountFormView()
          ],
        ),
      ),
    );
  }
}
