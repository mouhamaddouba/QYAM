part of 'app_pages.dart';

abstract class AppRoutes {
  // Splash
  static const String splash = '/splash';

  //region Auth
  static const String mainLogin = '/mainLogin';
  static const String studentLogin = '/studentLogin';
  static const String teacherLogin = '/teacherLogin';
  //endregion Auth

  //region Student Dashboard
  static const String studentDashboard = '/studentDashboard';

  static const String studentDashboardClasses = '/studentDashboardClasses';
  static const String studentDashboardPayments = '/studentDashboardPayments';
  static const String studentDashboardPaymentsDetails =
      '/studentDashboardPaymentsDetails';
  static const String studentDashboardAttendances =
      '/studentDashboardAttendances';
  static const String studentDashboardExams = '/studentDashboardExams';
  //endregion Student Dashboard

  //region Teacher Dashboard
  static const String teacherDashboard = '/teacherDashboard';

  static const String teacherDashboardClasses = '/teacherDashboardClasses';
  static const String teacherDashboardPayments = '/teacherDashboardPayments';
  static const String teacherDashboardPaymentsDetails =
      '/teacherDashboardPaymentsDetails';
  static const String teacherDashboardLates = '/teacherDashboardLates';
  static const String teacherDashboardExams = '/teacherDashboardExams';
  //endregion Teacher Dashboard

  //region Notifications
  static const String notifications = '/notifications';
  static const String notificationsDetails = '/notificationsDetails';
  //endregion Notifications

  //region Profile
  static const String studentProfile = '/studentProfile';
  static const String studentAccount = '/studentAccount';
  static const String teacherProfile = '/teacherProfile';
  static const String teacherAccount = '/teacherAccount';
  //endregion Profile
}
