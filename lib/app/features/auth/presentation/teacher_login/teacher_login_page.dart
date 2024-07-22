import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/teacher_login_controller.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/widgets/views/teacher_login_form_view.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/widgets/views/teacher_login_header_view.dart';

class TeacherLoginPage extends GetView<TeacherLoginController> {
  const TeacherLoginPage({
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
              TeacherLoginHeaderView(),

              // Form
              TeacherLoginFormView()
            ],
          ),
        ),
      ),
    );
  }
}
