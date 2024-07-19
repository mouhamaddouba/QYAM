import 'package:qyam/app/core/values/app_strings.dart';

final Map<String, String> enUS = {
  ///region Network validation messages
  AppStrings.success: 'Success',
  AppStrings.badRequest: 'Bad request',
  AppStrings.unAuthorized: 'Unauthorized',
  AppStrings.forbidden: 'Forbidden',
  AppStrings.notFound: 'Not found',
  AppStrings.conflict: 'Conflict',
  AppStrings.internalServerError:
      'Internal service error, please contact support',
  AppStrings.urlNotFound: 'URL not found',
  AppStrings.noInternetConnection: 'No internet connection',

  ///endregion Network validation messages

  ///region Error App
  AppStrings.failure: 'Failure',
  AppStrings.localFailure: 'Local storage failure',
  AppStrings.serverFailure: 'Server failure',
  AppStrings.localException: 'Local storage exception',
  AppStrings.serverException: 'Server exception',

  ///endregion Error App

  ///region Alert messages
  AppStrings.alertMassageNoContentText: 'Message does not contain text',
  AppStrings.alertSuccess: 'Success',
  AppStrings.alertError: 'Error',
  AppStrings.alertWarning: 'Warning',
  AppStrings.alertInfo: 'Info',
  AppStrings.alert: 'Alert',
  AppStrings.ok: 'OK',

  ///endregion Alert messages

  AppStrings.appName: 'QYAM',

  ///region auth UI
  AppStrings.student: 'Student',
  AppStrings.teacher: 'Teacher',
  AppStrings.studentLogin: 'Student Login',
  AppStrings.teacherLogin: 'Teacher Login',
  AppStrings.arabicCollageName: 'QYAM Collage',
  AppStrings.englishCollageName: 'معهد قيم',
  AppStrings.phoneNumber: 'Phone Number',
  AppStrings.password: 'Password',
  AppStrings.login: 'Login',

  ///endregion auth UI

  ///region Error Auth
  AppStrings.phoneNumberRequired: 'Phone number is required',
  AppStrings.passwordRequired: 'Password is required',
  AppStrings.isTeacherNotStudent: 'You are a teacher, not a student',
  AppStrings.isAccounterNotStudent: 'You are an accountant, not a student',
  AppStrings.isStaffNotStudent: 'You are a staff member, not a student',
  AppStrings.isStudentNotTeacher: 'You are a student, not a teacher',
  AppStrings.isAccounterNotTeacher: 'You are an accountant, not a teacher',
  AppStrings.isStaffNotTeacher: 'You are a staff member, not a teacher',

  ///endregion Error Auth

  ///region dashboard pages
  AppStrings.classes: 'Classes',
  AppStrings.payments: 'Payments',
  AppStrings.attendance: 'Attendance',
  AppStrings.teacherDelays: 'Delays',
  AppStrings.exams: 'Exams',

  ///endregion dashboard pages

  ///region classes
  AppStrings.sunday: 'Sunday',
  AppStrings.monday: 'Monday',
  AppStrings.tuesday: 'Tuesday',
  AppStrings.wednesday: 'Wednesday',
  AppStrings.thursday: 'Thursday',
  AppStrings.friday: 'Friday',
  AppStrings.saturday: 'Saturday',
  AppStrings.group: 'Group',
  AppStrings.timing: 'Timing',
  AppStrings.noClasses: 'No classes for today  ^_^',

  ///endregion classes

  ///region payments
  AppStrings.totalPaid: 'Total Paid',
  AppStrings.totalShouldPaid: 'Total Should Paid',
  AppStrings.totalRemainPaid: 'Remaining Amount',
  AppStrings.payNo: 'Payment Number',
  AppStrings.payment: 'Payment',
  AppStrings.sp: 'SYP',
  AppStrings.dateAndTime: 'Payment Date',
  AppStrings.notes: 'Notes',
  AppStrings.nothing: 'Nothing',
  AppStrings.noPayments: 'No payments available ^_^',

  ///endregion payments

  ///region lates
  AppStrings.selectADate: 'Select a Date',
  AppStrings.noLates: 'No delays available ^_^',
  AppStrings.from: 'From',
  AppStrings.to: 'To',
  AppStrings.minute: 'Minute',
  AppStrings.minutes: 'Minutes',

  ///endregion lates

  ///region exams
  AppStrings.newTab: 'Upcoming',
  AppStrings.doneTab: 'Completed',
  AppStrings.questionsDelivered: 'Form Delivered',
  AppStrings.answersDelivered: 'Answers Delivered',
  AppStrings.markDelivered: 'Marks Delivered',
  AppStrings.marksChecked: 'Marks Checked',
  AppStrings.examName: 'Exam Name',
  AppStrings.examType: 'Type',
  AppStrings.date: 'Date',
  AppStrings.day: 'Day',
  AppStrings.hour: 'Hour',
  AppStrings.teacherNots: 'Teacher Notes',
  AppStrings.adminNots: 'Admin Notes',
  AppStrings.noNots: 'No notes',
  AppStrings.noExam: 'No exams available ^_^',

  ///endregion exams

  ///region profile
  AppStrings.myAccount: 'My Account',
  AppStrings.language: 'App Language',
  AppStrings.arabicLanguage: 'Arabic',
  AppStrings.englishLanguage: 'English',
  AppStrings.themes: 'Themes',
  AppStrings.lightTheme: 'Light Mode',
  AppStrings.darkTheme: 'Dark Mode',
  AppStrings.about: 'About',
  AppStrings.contactUs: 'Contact Us',
  AppStrings.contactUsContent: 'Do you have any questions? Need assistance?',
  AppStrings.privacyPolice: 'Privacy Policy',
  AppStrings.deleteAccount: 'Delete Account',
  AppStrings.logout: 'Logout',

  ///endregion profile

  ///region Account
  AppStrings.profile: 'Profile',
  AppStrings.profileImage: 'Profile Image',
  AppStrings.fullName: 'Full Name',
  AppStrings.parentWhatsapp: 'Parent Whatsapp',
  AppStrings.fatherName: 'Father Name',
  AppStrings.fatherPhone: 'Father Phone',
  AppStrings.fatherJob: 'Father Job',
  AppStrings.motherName: 'Mother Name',
  AppStrings.motherPhone: 'Mother Phone',
  AppStrings.motherJob: 'Mother Job',
  AppStrings.logoutAlert: 'Are you sure you want to log out?',
  AppStrings.confirm: 'Confirm',
  AppStrings.cancel: 'Cancel',

  ///endregion Account

  ///region notification
  AppStrings.notification: 'Notifications',
  AppStrings.notificationDetails: 'Notification Details',
  AppStrings.noNotification: 'No notifications available ^_^',
  AppStrings.unKnowSender: 'The sender is unknown',
  AppStrings.unKnowEmail: 'No email',

  ///endregion notification
};
