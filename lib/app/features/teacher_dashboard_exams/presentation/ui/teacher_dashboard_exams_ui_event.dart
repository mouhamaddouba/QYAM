abstract class TeacherDashboardExamsUiEvent {
  factory TeacherDashboardExamsUiEvent.getExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  }) = GetExamsEvent;

  factory TeacherDashboardExamsUiEvent.tabbedChange({
    required int selectTab,
  }) = TabbedChangeEvent;

  factory TeacherDashboardExamsUiEvent.toNotification() = ToNotificationEvent;

  factory TeacherDashboardExamsUiEvent.toProfile() = ToProfileEvent;

  factory TeacherDashboardExamsUiEvent.refresh() = RefreshEvent;
}

class GetExamsEvent implements TeacherDashboardExamsUiEvent {
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

class TabbedChangeEvent implements TeacherDashboardExamsUiEvent {
  final int selectTab;

  TabbedChangeEvent({
    required this.selectTab,
  });
}

class ToNotificationEvent implements TeacherDashboardExamsUiEvent {
  ToNotificationEvent();
}

class ToProfileEvent implements TeacherDashboardExamsUiEvent {
  ToProfileEvent();
}

class RefreshEvent implements TeacherDashboardExamsUiEvent {
  RefreshEvent();
}
