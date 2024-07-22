import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard/presentation/student_dashboard_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard/presentation/widgets/views/student_dashboard_tab_bar_widget.dart';

class StudentDashboardPage extends GetView<StudentDashboardController> {
  const StudentDashboardPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return IndexedStack(
            index: controller.state().selectedIndex,
            children: controller.state().pages,
          );
        },
      ),
      bottomNavigationBar: StudentDashboardTabBarView(),
    );
  }
}
