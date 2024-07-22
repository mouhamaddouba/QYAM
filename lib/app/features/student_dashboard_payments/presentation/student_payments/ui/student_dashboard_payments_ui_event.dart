import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';

abstract class StudentDashboardPaymentsUiEvent {
  factory StudentDashboardPaymentsUiEvent.getPayments({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) = GetPaymentsEvent;

  factory StudentDashboardPaymentsUiEvent.showDialog({
    required StudentPaymentsDataList paymentsData,
  }) = ShowDialogEvent;

  factory StudentDashboardPaymentsUiEvent.toNotification() =
      ToNotificationEvent;

  factory StudentDashboardPaymentsUiEvent.toProfile() = ToProfileEvent;

  factory StudentDashboardPaymentsUiEvent.refresh() = RefreshEvent;
}

class GetPaymentsEvent implements StudentDashboardPaymentsUiEvent {
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

class ToNotificationEvent implements StudentDashboardPaymentsUiEvent {
  ToNotificationEvent();
}

class ToProfileEvent implements StudentDashboardPaymentsUiEvent {
  ToProfileEvent();
}

class RefreshEvent implements StudentDashboardPaymentsUiEvent {
  RefreshEvent();
}

class ShowDialogEvent implements StudentDashboardPaymentsUiEvent {
  final StudentPaymentsDataList paymentsData;

  ShowDialogEvent({
    required this.paymentsData,
  });
}
