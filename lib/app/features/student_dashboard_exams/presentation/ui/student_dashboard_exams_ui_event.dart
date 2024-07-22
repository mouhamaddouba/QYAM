abstract class StudentDashboardExamsUiEvent {
  factory StudentDashboardExamsUiEvent.getExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  }) = GetExamsEvent;

  factory StudentDashboardExamsUiEvent.tabbedChange({
    required int selectTab,
  }) = TabbedChangeEvent;

  factory StudentDashboardExamsUiEvent.toNotification() = ToNotificationEvent;

  factory StudentDashboardExamsUiEvent.toProfile() = ToProfileEvent;

  factory StudentDashboardExamsUiEvent.refresh() = RefreshEvent;
}

class GetExamsEvent implements StudentDashboardExamsUiEvent {
  final String studyYear;
  final int pageSize;
  final int pageNumber;
  final bool withPaging;
  final String status;

  GetExamsEvent({
    required this.studyYear,
    required this.pageSize,
    required this.pageNumber,
    required this.withPaging,
    required this.status,
  });
}

class TabbedChangeEvent implements StudentDashboardExamsUiEvent {
  final int selectTab;

  TabbedChangeEvent({
    required this.selectTab,
  });
}

class ToNotificationEvent implements StudentDashboardExamsUiEvent {
  ToNotificationEvent();
}

class ToProfileEvent implements StudentDashboardExamsUiEvent {
  ToProfileEvent();
}

class RefreshEvent implements StudentDashboardExamsUiEvent {
  RefreshEvent();
}
