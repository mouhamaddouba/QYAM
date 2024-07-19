abstract class AppStrings {
  ///region Network validation messages
  static const String success = 'success';
  static const String badRequest = 'badRequest';
  static const String unAuthorized = 'unAuthorized';
  static const String forbidden = 'forbidden';
  static const String notFound = 'notFound';
  static const String conflict = 'conflict';
  static const String internalServerError = 'internalServerError';
  static const String urlNotFound = 'urlNotFound';
  static const String noInternetConnection = 'noInternetConnection';

  ///endregion Network validation messages

  ///region Error App
  static const String failure = 'failure';
  static const String localFailure = 'localFailure';
  static const String serverFailure = 'serverFailure';
  static const String localException = 'localException';
  static const String serverException = 'serverException';

  ///endregion Error App

  ///region Alert messages
  static const String alertMassageNoContentText = 'alertMassageNoContentText';
  static const String alertSuccess = 'alertSuccess';
  static const String alertError = 'alertError';
  static const String alertWarning = 'alertWarning';
  static const String alertInfo = 'alertInfo';
  static const String alert = 'alert';
  static const String ok = 'ok';
  static const String noticeLabel = 'noticeLabel';

  ///endregion Alert messages

  static const String appName = "appName";

  ///region auth UI
  static const String student = 'student';
  static const String teacher = 'teacher';
  static const String studentLogin = 'loginStudent';
  static const String teacherLogin = 'teacherLogin';
  static const String arabicCollageName = 'arabicCollageName';
  static const String englishCollageName = 'englishCollageName';
  static const String phoneNumber = 'phoneNumber';
  static const String password = 'password';
  static const String login = 'login';

  ///endregion auth UI

  ///region Error Auth
  static const String phoneNumberRequired = 'phoneNumberRequired';
  static const String passwordRequired = 'passwordRequired';
  static const String isTeacherNotStudent = 'isTeacherNotStudent';
  static const String isAccounterNotStudent = 'isAccounterNotStudent';
  static const String isStaffNotStudent = 'isStaffNotStudent';
  static const String isStudentNotTeacher = 'isStudentNotTeacher';
  static const String isAccounterNotTeacher = 'isAccounterNotTeacher';
  static const String isStaffNotTeacher = 'isStaffNotTeacher';

  ///endregion Error Auth

  ///region dashboard pages
  static const String classes = 'classes';
  static const String payments = 'payments';
  static const String attendance = 'attendance';
  static const String teacherDelays = 'teacherDelays';
  static const String exams = 'exams';

  ///endregion dashboard pages

  ///region Classes
  static const String sunday = 'sunday';
  static const String monday = 'monday';
  static const String tuesday = 'tuesday';
  static const String wednesday = 'wednesday';
  static const String thursday = 'thursday';
  static const String friday = 'friday';
  static const String saturday = 'saturday';
  static const String group = 'group';
  static const String timing = 'timing';
  static const String noClasses = 'noClasses';

  ///endregion Classes

  ///region payments
  static const String totalPaid = 'totalPaid';
  static const String totalShouldPaid = 'totalShouldPaid';
  static const String totalRemainPaid = 'totalRemainPaid';
  static const String payNo = 'payNo';
  static const String payment = 'payment';
  static const String sp = 'sp';
  static const String dateAndTime = 'dateAndTime';
  static const String notes = 'notes';
  static const String nothing = 'nothing';
  static const String noPayments = 'noPayments';

  ///endregion payments

  ///region lates
  static const String noLates = 'noLates';
  static const String selectADate = 'selectADate';
  static const String from = 'from';
  static const String to = 'to';
  static const String minute = 'minute';
  static const String minutes = 'minutes';

  ///endregion lates

  ///region exams
  static const String doneTab = 'done';
  static const String newTab = 'new';
  static const String questionsDelivered = 'questionsDelivered';
  static const String answersDelivered = 'answersDelivered';
  static const String markDelivered = 'markDelivered';
  static const String marksChecked = 'marksChecked';
  static const String examName = 'examName';
  static const String examType = 'examType';
  static const String date = 'date';
  static const String day = 'day';
  static const String hour = 'hour';
  static const String teacherNots = 'teacherNots';
  static const String adminNots = 'adminNots';
  static const String noNots = 'noNots';
  static const String noExam = "noExam";

  ///endregion exams

  ///region profile
  static const String myAccount = 'myAccount';
  static const String language = "language";
  static const String englishLanguage = "englishLanguage";
  static const String arabicLanguage = "arabicLanguage";
  static const String themes = 'themes';
  static const String lightTheme = 'lightTheme';
  static const String darkTheme = 'darkTheme';
  static const String about = 'about';
  static const String contactUs = 'contactUs';
  static const String contactUsContent = 'contactUsContent';
  static const String privacyPolice = 'privacyPolice';
  static const String deleteAccount = 'deleteAccount';
  static const String logout = 'logout';

  ///endregion profile

  ///region Account
  static const String profile = 'profile';
  static const String profileImage = "profileImage";
  static const String fullName = 'fullName';
  static const String parentWhatsapp = 'parentWhatsapp';
  static const String fatherName = 'fatherName';
  static const String fatherPhone = 'fatherPhone';
  static const String fatherJob = 'fatherJob';
  static const String motherName = 'motherName';
  static const String motherPhone = 'motherPhone';
  static const String motherJob = 'motherJob';
  static const String logoutAlert = 'logoutAlert';
  static const String confirm = 'confirm';
  static const String cancel = 'cancel';

  ///endregion Account

  ///region notification
  static const String notification = 'notification';
  static const String notificationDetails = 'notificationDetails';
  static const String noNotification = 'noNotification';
  static const String unKnowSender = 'unKnowSender';
  static const String unKnowEmail = 'unKnowEmail';

  ///endregion notification
}
