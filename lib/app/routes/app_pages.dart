import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/student_login_page.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/notifications_binding.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/notifications_details_binding.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications_details/notifications_details_page.dart';

import 'package:qyam_novers_mobile/app/features/splash/presentation/splash_binding.dart';
import 'package:qyam_novers_mobile/app/features/splash/presentation/splash_page.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/main_login_binding.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/main_login_page.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/student_login_binding.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/teacher_login_binding.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/teacher_login_page.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard/presentation/student_dashboard_binding.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard/presentation/student_dashboard_page.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_binding.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/student_dashboard_attendances_binding.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/presentation/student_dashboard_exams_binding.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/student_dashboard_payments_binding.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_binding.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_page.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_binding.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_page.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard/presentation/teacher_dashboard_binding.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard/presentation/teacher_dashboard_page.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/teacher_dashboard_classes_binding.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/teacher_dashboard_lates_binding.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/teacher_dashboard_exams_binding.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/teacher_dashboard_payments_binding.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/teacher_account_binding.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/teacher_account_page.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/teacher_profile_binding.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/teacher_profile_page.dart';

import '../features/notifications/presentation/notifications/notifications_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    //splash
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),

    /* region Auth */

    //main Auth
    GetPage(
      name: AppRoutes.mainLogin,
      page: () => const MainLoginPage(),
      binding: MainLoginBinding(),
      transition: Transition.fadeIn,
    ),

    //student Login
    GetPage(
      name: AppRoutes.studentLogin,
      page: () => const StudentLoginPage(),
      binding: StudentLoginBinding(),
      transition: Transition.fadeIn,
    ),

    //teacher Login
    GetPage(
      name: AppRoutes.teacherLogin,
      page: () => const TeacherLoginPage(),
      binding: TeacherLoginBinding(),
      transition: Transition.fadeIn,
    ),

    /* endregion Auth */

    //student Dashboard
    GetPage(
      name: AppRoutes.studentDashboard,
      page: () => const StudentDashboardPage(),
      bindings: [
        StudentDashboardBinding(),
        StudentDashboardClassesBinding(),
        StudentDashboardPaymentsBinding(),
        StudentDashboardAttendancesBinding(),
        StudentDashboardExamsBinding(),
      ],
      transition: Transition.fadeIn,
    ),

    //teacher Dashboard
    GetPage(
      name: AppRoutes.teacherDashboard,
      page: () => const TeacherDashboardPage(),
      bindings: [
        TeacherDashboardBinding(),
        TeacherDashboardClassesBinding(),
        TeacherDashboardPaymentsBinding(),
        TeacherDashboardLatesBinding(),
        TeacherDashboardExamsBinding(),
      ],
      transition: Transition.fadeIn,
    ),

    /* region Notifications */

    //notifications
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsPage(),
      binding: NotificationsBinding(),
      transition: Transition.fadeIn,
    ),

    //notifications Details
    GetPage(
      name: AppRoutes.notificationsDetails,
      page: () => NotificationsDetailsPage(),
      binding: NotificationsDetailsBinding(),
      transition: Transition.fadeIn,
    ),

    /* endregion Notifications */

    /* region Profile & account student */

    //student Profile
    GetPage(
      name: AppRoutes.studentProfile,
      page: () => const StudentProfilePage(),
      binding: StudentProfileBinding(),
      transition: Transition.fadeIn,
    ),

    //student Account
    GetPage(
      name: AppRoutes.studentAccount,
      page: () => const StudentAccountPage(),
      binding: StudentAccountBinding(),
      transition: Transition.fadeIn,
    ),

    /* endregion Profile & account student */

    /* region Profile & account teacher */

    //teacher Profile
    GetPage(
      name: AppRoutes.teacherProfile,
      page: () => const TeacherProfilePage(),
      binding: TeacherProfileBinding(),
      transition: Transition.fadeIn,
    ),

    //teacher Account
    GetPage(
      name: AppRoutes.teacherAccount,
      page: () => const TeacherAccountPage(),
      binding: TeacherAccountBinding(),
      transition: Transition.fadeIn,
    ),

    /* region Profile & account teacher */
  ];
}
