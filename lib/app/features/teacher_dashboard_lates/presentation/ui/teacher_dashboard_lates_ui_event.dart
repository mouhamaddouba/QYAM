abstract class TeacherDashboardLatesUiEvent {
  factory TeacherDashboardLatesUiEvent.getLates({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String toDate,
    required String fromDate,
  }) = GetLatesEvent;

  factory TeacherDashboardLatesUiEvent.toNotification() = ToNotificationEvent;

  factory TeacherDashboardLatesUiEvent.toProfile() = ToProfileEvent;

  factory TeacherDashboardLatesUiEvent.refresh() = RefreshEvent;
}

class GetLatesEvent implements TeacherDashboardLatesUiEvent {
  final String studyYear;
  final int pageSize;
  final int pageNumber;
  final bool withPaging;
  final String toDate;
  final String fromDate;

  GetLatesEvent({
    required this.studyYear,
    required this.pageSize,
    required this.pageNumber,
    required this.withPaging,
    required this.toDate,
    required this.fromDate,
  });
}

class ToNotificationEvent implements TeacherDashboardLatesUiEvent {
  ToNotificationEvent();
}

class ToProfileEvent implements TeacherDashboardLatesUiEvent {
  ToProfileEvent();
}

class RefreshEvent implements TeacherDashboardLatesUiEvent {
  RefreshEvent();
}
