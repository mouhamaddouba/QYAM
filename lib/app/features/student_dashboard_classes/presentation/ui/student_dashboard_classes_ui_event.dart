import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/entities/student_classes.dart';

abstract class StudentDashboardClassesUiEvent {
  factory StudentDashboardClassesUiEvent.getClasses({
    required String studyYear,
    required bool isStudent,
  }) = GetClassesEvent;

  factory StudentDashboardClassesUiEvent.selectDays({
    required int dayId,
  }) = SelectDaysEvent;

  factory StudentDashboardClassesUiEvent.filterClassesByDay({
    required List<StudentClasses> filteredData,
  }) = FilterClassesByDayEvent;

  factory StudentDashboardClassesUiEvent.toNotification() = ToNotificationEvent;

  factory StudentDashboardClassesUiEvent.toProfile() = ToProfileEvent;

  factory StudentDashboardClassesUiEvent.refresh() = RefreshEvent;
}

class GetClassesEvent implements StudentDashboardClassesUiEvent {
  final String studyYear;
  final bool isStudent;

  GetClassesEvent({
    required this.studyYear,
    required this.isStudent,
  });
}

class ToNotificationEvent implements StudentDashboardClassesUiEvent {
  ToNotificationEvent();
}

class ToProfileEvent implements StudentDashboardClassesUiEvent {
  ToProfileEvent();
}

class SelectDaysEvent implements StudentDashboardClassesUiEvent {
  final int dayId;

  SelectDaysEvent({
    required this.dayId,
  });
}

class FilterClassesByDayEvent implements StudentDashboardClassesUiEvent {
  final List<StudentClasses> filteredData;

  FilterClassesByDayEvent({
    required this.filteredData,
  });
}

class RefreshEvent implements StudentDashboardClassesUiEvent {
  RefreshEvent();
}
