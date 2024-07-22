import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard/presentation/widgets/views/teacher_dashboard_tab_bar_view.dart';

import 'teacher_dashboard_controller.dart';

class TeacherDashboardPage extends GetView<TeacherDashboardController> {
  const TeacherDashboardPage({
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
      bottomNavigationBar: TeacherDashboardTabBarView(),
    );
  }
}
