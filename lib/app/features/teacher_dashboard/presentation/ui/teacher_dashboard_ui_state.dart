import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/teacher_dashboard_exams_page.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/teacher_dashboard_lates_page.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/teacher_dashboard_classes_page.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/teacher_dashboard_payments_page.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_bottom_bar_widget.dart';

class TeacherDashboardUiState {
  final List<GetView> pages;
  final int selectedIndex;

  List<AppTabBarItem> get items => <AppTabBarItem>[
        // Classes
        AppTabBarItem(
          icon: AppAssets.classesTab,
          text: AppStrings.classes.tr,
        ),

        // Payments
        AppTabBarItem(
          icon: AppAssets.paymentsTab,
          text: AppStrings.payments.tr,
        ),

        // Lates
        AppTabBarItem(
          icon: AppAssets.latesTab,
          text: AppStrings.teacherDelays.tr,
        ),

        // Exams
        AppTabBarItem(
          icon: AppAssets.examesTab,
          text: AppStrings.exams.tr,
        ),
      ];

  TeacherDashboardUiState({
    required this.pages,
    required this.selectedIndex,
  });

  TeacherDashboardUiState.defaultObj()
      : this(
          selectedIndex: 0,
          pages: <GetView>[
            const TeacherDashboardClassesPage(),
            const TeacherDashboardPaymentsPage(),
            const TeacherDashboardLatesPage(),
            const TeacherDashboardExamsPage(),
          ],
        );

  TeacherDashboardUiState copyWith({
    List<GetView>? pages,
    int? selectedIndex,
  }) =>
      TeacherDashboardUiState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        pages: pages ?? this.pages,
      );
}
