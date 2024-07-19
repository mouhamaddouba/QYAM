import 'package:qyam/app/core/values/app_strings.dart';

final Map<String, String> arSA = {
  ///region Network validation messages
  AppStrings.success: 'ناجح',
  AppStrings.badRequest: 'إستجابة سيئة',
  AppStrings.unAuthorized: 'غير مسجل',
  AppStrings.forbidden: 'محظور',
  AppStrings.notFound: 'غير موجود',
  AppStrings.conflict: 'Conflict',
  AppStrings.internalServerError: 'خطأ داخلي في الخدمة ، يرجى الاتصال بالدعم',
  AppStrings.urlNotFound: 'الرابط غير موجود',
  AppStrings.noInternetConnection: 'لا يوجد إتصال بالإنترنت',

  ///endregion Network validation messages

  ///region Error App
  AppStrings.failure: 'فشل',
  AppStrings.localFailure: 'فشل في التخزين',
  AppStrings.serverFailure: 'فشل في السيرفر',
  AppStrings.localException: 'خطأ في التخزين',
  AppStrings.serverException: 'خطأ في السيرفر',

  ///endregion Error App

  ///region Alert messages
  AppStrings.alertMassageNoContentText: 'تحذير الرسالة لا تحوي نص',
  AppStrings.alertSuccess: 'نجاح',
  AppStrings.alertError: 'خطأ',
  AppStrings.alertWarning: 'تحذير',
  AppStrings.alertInfo: 'معلومات',
  AppStrings.alert: 'تحذير',
  AppStrings.ok: 'حسناً',

  ///endregion Alert messages

  AppStrings.appName: 'QYAM',

  ///region auth UI
  AppStrings.student: 'الطالب',
  AppStrings.teacher: 'الأستاذ',
  AppStrings.studentLogin: 'تسجيل الطالب',
  AppStrings.teacherLogin: 'تسجيل الأستاذ',
  AppStrings.arabicCollageName: 'معهد قيم',
  AppStrings.englishCollageName: 'QYAM Collage',
  AppStrings.phoneNumber: 'رقم الهاتف',
  AppStrings.password: 'كلمة المرور',
  AppStrings.login: 'تسجيل الدخول',

  ///endregion auth UI

  ///region Error Auth
  AppStrings.phoneNumberRequired: 'رقم الهاتف مطلوب',
  AppStrings.passwordRequired: 'كلمة السر مطلوبة',
  AppStrings.isTeacherNotStudent: 'أنت أستاذ ولست طالب',
  AppStrings.isAccounterNotStudent: 'أنت محاسب ولست طالب',
  AppStrings.isStaffNotStudent: 'أنت موظف ولست طالب',
  AppStrings.isStudentNotTeacher: 'أنت طالب ولست أستاذ',
  AppStrings.isAccounterNotTeacher: 'أنت محاسب ولست أستاذ',
  AppStrings.isStaffNotTeacher: 'أنت موظف ولست أستاذ',

  ///endregion Error Auth

  ///region dashboard pages
  AppStrings.classes: 'الحصص',
  AppStrings.payments: 'الدفعات',
  AppStrings.attendance: 'الحضور',
  AppStrings.teacherDelays: 'التأخيرات',
  AppStrings.exams: 'المذاكرات',

  ///endregion dashboard pages

  ///region classes
  AppStrings.sunday: 'الأحد',
  AppStrings.monday: 'الإثنين',
  AppStrings.tuesday: 'الثلاثاء',
  AppStrings.wednesday: 'الأربعاء',
  AppStrings.thursday: 'الخميس',
  AppStrings.friday: 'الجمعة',
  AppStrings.saturday: 'السبت',
  AppStrings.group: 'الفئة',
  AppStrings.timing: 'التوقيت',
  AppStrings.noClasses: 'لا يوجد حصص اليوم  ^_^',

  ///endregion classes

  ///region payments
  AppStrings.totalPaid: 'المبلغ الكلي',
  AppStrings.totalShouldPaid: 'المبلغ الواجب دفعه',
  AppStrings.totalRemainPaid: 'المبلغ المتبقي',
  AppStrings.payNo: 'رقم الدفعة',
  AppStrings.payment: 'دفع',
  AppStrings.sp: 'ل.س',
  AppStrings.dateAndTime: 'تاريخ الدفعة',
  AppStrings.notes: 'ملاحظات',
  AppStrings.nothing: 'لايوجد',
  AppStrings.noPayments: 'لا يوجد دفعات  ^_^',

  ///endregion payments

  ///region lates
  AppStrings.selectADate: 'إختر تاريخ',
  AppStrings.noLates: 'لا يوجد تأخيرات  ^_^',
  AppStrings.from: 'من',
  AppStrings.to: 'إلى',
  AppStrings.minute: 'دقيقة',
  AppStrings.minutes: 'دقائق',

  ///endregion lates

  ///region exams
  AppStrings.newTab: 'قادمة',
  AppStrings.doneTab: 'منجزة',
  AppStrings.questionsDelivered: 'تم تسليم النموذج',
  AppStrings.answersDelivered: 'تم تسليم الأجوبة',
  AppStrings.markDelivered: 'تسليم العلامات',
  AppStrings.marksChecked: 'تدقيق العلامات',
  AppStrings.examName: 'اسم المذاكرة',
  AppStrings.examType: 'النوع',
  AppStrings.date: 'التاريخ',
  AppStrings.day: 'اليوم',
  AppStrings.hour: 'الساعة',
  AppStrings.teacherNots: 'ملاحظات الأستاذ',
  AppStrings.adminNots: 'ملاحظات المدير',
  AppStrings.noNots: 'لا يوجد ملاحظات',
  AppStrings.noExam: ' لا يوجد مذاكرات  ^_^',

  ///endregion exams

  ///region profile
  AppStrings.myAccount: 'الملف الشخصي',
  AppStrings.language: 'لغة التطبيق',
  AppStrings.arabicLanguage: 'العربية',
  AppStrings.englishLanguage: 'الإنكليزية',
  AppStrings.themes: 'المظهر',
  AppStrings.lightTheme: 'الوضع النهاري',
  AppStrings.darkTheme: 'الوضع الليلي',
  AppStrings.about: 'معلومات التطبيق',
  AppStrings.contactUs: 'اتصل بنا',
  AppStrings.contactUsContent: 'هل لديك أسئلة؟ هل تحتاج إلى المساعدة',
  AppStrings.privacyPolice: 'الخصوصية',
  AppStrings.deleteAccount: 'حذف حسابي',
  AppStrings.logout: 'تسجيل الخروج',

  ///endregion profile

  ///region Account
  AppStrings.profile: 'الملف الشخصي',
  AppStrings.profileImage: 'الصورة الشخصية',
  AppStrings.fullName: 'الإسم الكامل',
  AppStrings.parentWhatsapp: 'واتس اب الأهل',
  AppStrings.fatherName: 'اسم الأب',
  AppStrings.fatherPhone: 'رقم الأب',
  AppStrings.fatherJob: 'عمل الأب',
  AppStrings.motherName: 'اسم الأم',
  AppStrings.motherPhone: 'رقم الأم',
  AppStrings.motherJob: 'عمل الأم',
  AppStrings.logoutAlert: 'هل تريد تسجيل الخروج ؟',
  AppStrings.confirm: 'تأكيد',
  AppStrings.cancel: 'إلغاء',

  ///endregion Account

  ///region notification
  AppStrings.notification: 'الإشعارات',
  AppStrings.notificationDetails: 'تفاصيل الإشعار',
  AppStrings.noNotification: 'لا يوجد إشعارات  ^_^',
  AppStrings.unKnowSender: 'المرسل غير معروف',
  AppStrings.unKnowEmail: 'لا يوجد إيميل'

  ///endregion notification
};
