abstract class AppUrls {
  static const String baseUrl = 'http://104.238.159.155:4041/qiam-api';

  ///API accounts
  static String login() => '/api/MobAccounts/Login';

  ///API classes
  static String classes({
    required String studyYear,
    required bool isStudent,
  }) =>
      '/api/MobWeekPrograms/GetFiltered?studyYear=$studyYear&isStudent=$isStudent';

  ///API payments
  static String payments({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) =>
      '/api/MobPayments/GetFiltered?studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging';

  ///API attendances
  static String attendances({
    required String studyYear,
    required String year,
    required String month,
  }) =>
      '/api/MobAttendances/GetFiltered?studyYear=$studyYear&year=$year&month=$month';

  ///API late
  static String lates({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String toDate,
    required String fromDate,
  }) =>
      '/api/MobTeacherLates/GetFiltered?studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging&toDate=$toDate&fromDate=$fromDate';

  ///API student_exams
  static String studentExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  }) =>
      '/api/MobExams/GetFilteredStudent?culture=ar-SY&studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging&status=$status';

  ///API teacher_exams
  static String teacherExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  }) =>
      '/api/MobExams/GetFiltered?studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging&status=$status';

  ///API profile
  static String profile() => '/api/MobUsers/Update';

  ///API notifications
  static String notification({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) =>
      '/api/MobNotifications/GetFiltered?studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging';
}
