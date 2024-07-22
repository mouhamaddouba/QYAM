import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_tab_bar_widget.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/teacher_dashboard_exams_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/ui/teacher_dashboard_exams_ui_event.dart';

class TeacherDashboardExamsTabsView
    extends GetView<TeacherDashboardExamsController> {
  const TeacherDashboardExamsTabsView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Tabs
        return SizedBox(
          height: AppDimensions.paddingOrMargin50,
          child: AppTabBarWidget(
            isScrollable: true,
            isBottomIndicator: true,
            numberTabs: AppConstants.numberTabs06,
            mode: AppConstants.modTabs,
            icons: const [
              Icons.abc,
              Icons.ac_unit_outlined,
              Icons.abc,
              Icons.ac_unit_outlined,
              Icons.abc,
              Icons.ac_unit_outlined,
            ],
            titles: controller.state().tabs.map((e) => e.tr).toList(),
            selectedIndex: controller.state().selectedTab,
            onTap: (index) {
              controller.on(
                event: TeacherDashboardExamsUiEvent.tabbedChange(
                  selectTab: index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
