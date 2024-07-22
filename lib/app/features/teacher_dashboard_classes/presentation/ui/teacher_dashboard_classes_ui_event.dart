import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/entities/teacher_classes.dart';

abstract class TeacherDashboardClassesUiEvent {
  factory TeacherDashboardClassesUiEvent.getClasses({
    required String studyYear,
    required bool isStudent,
  }) = GetClassesEvent;

  factory TeacherDashboardClassesUiEvent.selectDays({
    required int dayId,
  }) = SelectDaysEvent;

  factory TeacherDashboardClassesUiEvent.filterClassesByDay({
    required List<TeacherClasses> filteredData,
  }) = FilterClassesByDayEvent;

  factory TeacherDashboardClassesUiEvent.toNotification() = ToNotificationEvent;

  factory TeacherDashboardClassesUiEvent.toProfile() = ToProfileEvent;

  factory TeacherDashboardClassesUiEvent.refresh() = RefreshEvent;
}

class GetClassesEvent implements TeacherDashboardClassesUiEvent {
  final String studyYear;
  final bool isStudent;

  GetClassesEvent({
    required this.studyYear,
    required this.isStudent,
  });
}

class ToNotificationEvent implements TeacherDashboardClassesUiEvent {
  ToNotificationEvent();
}

class ToProfileEvent implements TeacherDashboardClassesUiEvent {
  ToProfileEvent();
}

class SelectDaysEvent implements TeacherDashboardClassesUiEvent {
  final int dayId;

  SelectDaysEvent({
    required this.dayId,
  });
}

class FilterClassesByDayEvent implements TeacherDashboardClassesUiEvent {
  final List<TeacherClasses> filteredData;

  FilterClassesByDayEvent({
    required this.filteredData,
  });
}

class RefreshEvent implements TeacherDashboardClassesUiEvent {
  RefreshEvent();
}
