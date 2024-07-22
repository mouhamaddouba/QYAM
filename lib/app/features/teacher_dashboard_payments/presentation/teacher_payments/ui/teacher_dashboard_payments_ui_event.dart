import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/entities/teacher_payments.dart';

abstract class TeacherDashboardPaymentsUiEvent {
  factory TeacherDashboardPaymentsUiEvent.getPayments({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) = GetPaymentsEvent;

  factory TeacherDashboardPaymentsUiEvent.showDialog({
    required TeacherPaymentsDataList paymentsData,
  }) = ShowDialogEvent;

  factory TeacherDashboardPaymentsUiEvent.toNotification() =
      ToNotificationEvent;

  factory TeacherDashboardPaymentsUiEvent.toProfile() = ToProfileEvent;

  factory TeacherDashboardPaymentsUiEvent.refresh() = RefreshEvent;
}

class GetPaymentsEvent implements TeacherDashboardPaymentsUiEvent {
  final String studyYear;
  final int pageSize;
  final int pageNumber;
  final bool withPaging;

  GetPaymentsEvent({
    required this.studyYear,
    required this.pageSize,
    required this.pageNumber,
    required this.withPaging,
  });
}

class ToNotificationEvent implements TeacherDashboardPaymentsUiEvent {
  ToNotificationEvent();
}

class ToProfileEvent implements TeacherDashboardPaymentsUiEvent {
  ToProfileEvent();
}

class RefreshEvent implements TeacherDashboardPaymentsUiEvent {
  RefreshEvent();
}

class ShowDialogEvent implements TeacherDashboardPaymentsUiEvent {
  final TeacherPaymentsDataList paymentsData;

  ShowDialogEvent({
    required this.paymentsData,
  });
}
