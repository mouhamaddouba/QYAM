import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/student_dashboard_exams_page.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_page.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/student_dashboard_attendances_page.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/student_dashboard_payments_page.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_bottom_bar_widget.dart';

class StudentDashboardUiState {
  final int selectedIndex;
  final List<GetView> pages;

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

        // Attendances
        AppTabBarItem(
          icon: AppAssets.attendancesTab,
          text: AppStrings.attendance.tr,
        ),

        // Exams
        AppTabBarItem(
          icon: AppAssets.examesTab,
          text: AppStrings.exams.tr,
        ),
      ];

  StudentDashboardUiState({
    required this.selectedIndex,
    required this.pages,
  });

  StudentDashboardUiState.defaultObj()
      : this(
          selectedIndex: 0,
          pages: <GetView>[
            const StudentDashboardClassesPage(),
            const StudentDashboardPaymentsPage(),
            const StudentDashboardAttendancesPage(),
            const StudentDashboardExamsPage(),
          ],
        );

  StudentDashboardUiState copyWith({
    int? selectedIndex,
    List<GetView>? pages,
  }) =>
      StudentDashboardUiState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        pages: pages ?? this.pages,
      );
}
