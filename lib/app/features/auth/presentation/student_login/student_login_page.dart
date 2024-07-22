import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/student_login_controller.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/widgets/views/student_login_form_view.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/widgets/views/student_login_header_view.dart';

class StudentLoginPage extends GetView<StudentLoginController> {
  const StudentLoginPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: const [
              // Header
              StudentLoginHeaderView(),

              // Form
              StudentLoginFormView()
            ],
          ),
        ),
      ),
    );
  }
}
