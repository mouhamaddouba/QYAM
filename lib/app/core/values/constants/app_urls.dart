abstract class AppUrls {
  static const String baseUrl = 'http://104.238.159.155:4041/qiam-api';

  //region Accounts
  static String login() => '/api/MobAccounts/Login';
  //endregion Accounts

  /* region Dashboard */

  //region classes
  static String classes({
    required String studyYear,
    required bool isStudent,
  }) =>
      '/api/MobWeekPrograms/GetFiltered?studyYear=$studyYear&isStudent=$isStudent';

  //region payments
  static String payments({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) =>
      '/api/MobPayments/GetFiltered?studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging';

  //region attendances
  static String attendances({
    required String studyYear,
    required String year,
    required String month,
  }) =>
      '/api/MobAttendances/GetFiltered?studyYear=$studyYear&year=$year&month=$month';

  //region lates
  static String lates({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String toDate,
    required String fromDate,
  }) =>
      '/api/MobTeacherLates/GetFiltered?studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging&toDate=$toDate&fromDate=$fromDate';

  //region students exams
  static String studentExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  }) =>
      '/api/MobExams/GetFilteredStudent?culture=ar-SY&studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging&status=$status';

  //region teacher exams
  static String teacherExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  }) =>
      '/api/MobExams/GetFiltered?studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging&status=$status';

  /* endregion Dashboard */

  //region Profile
  static String profile() => '/api/MobUsers/Update';
  //endregion Profile

  //region Notifications
  static String notification({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) =>
      '/api/MobNotifications/GetFiltered?studyYear=$studyYear&pageSize=$pageSize&pageNumber=$pageNumber&withPaging=$withPaging';
  //endregion Notifications
}
