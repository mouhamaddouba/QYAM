import 'package:flutter/material.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/entities/student_attendances.dart';

abstract class StudentDashboardAttendancesUiEvent {
  factory StudentDashboardAttendancesUiEvent.selectDate({
    required DateTime selectDateId,
  }) = SelectDateEvent;

  factory StudentDashboardAttendancesUiEvent.getAttendances({
    required String studyYear,
    required String year,
    required String month,
  }) = GetAttendancesEvent;

  factory StudentDashboardAttendancesUiEvent.toNotification() =
      ToNotificationEvent;

  factory StudentDashboardAttendancesUiEvent.toProfile() = ToProfileEvent;

  factory StudentDashboardAttendancesUiEvent.pageCalenderChanged({
    required int yearChange,
    required int monthChange,
  }) = PageCalenderChangedEvent;

  factory StudentDashboardAttendancesUiEvent.filterAttendancesByDay({
    required List<StudentAttendances> filteredData,
  }) = FilterAttendancesByDayEvent;

  factory StudentDashboardAttendancesUiEvent.calenderBuilder({
    required DateTime dateTime,
    required Color color,
  }) = CalenderBuilderEvent;

  factory StudentDashboardAttendancesUiEvent.refresh() = RefreshEvent;
}

class SelectDateEvent implements StudentDashboardAttendancesUiEvent {
  final DateTime selectDateId;

  SelectDateEvent({
    required this.selectDateId,
  });
}

class GetAttendancesEvent implements StudentDashboardAttendancesUiEvent {
  final String studyYear;
  final String year;
  final String month;

  GetAttendancesEvent({
    required this.studyYear,
    required this.year,
    required this.month,
  });
}

class ToProfileEvent implements StudentDashboardAttendancesUiEvent {
  ToProfileEvent();
}

class ToNotificationEvent implements StudentDashboardAttendancesUiEvent {
  ToNotificationEvent();
}

class PageCalenderChangedEvent implements StudentDashboardAttendancesUiEvent {
  final int yearChange;
  final int monthChange;

  PageCalenderChangedEvent({
    required this.yearChange,
    required this.monthChange,
  });
}

class FilterAttendancesByDayEvent
    implements StudentDashboardAttendancesUiEvent {
  final List<StudentAttendances> filteredData;

  FilterAttendancesByDayEvent({
    required this.filteredData,
  });
}

class CalenderBuilderEvent implements StudentDashboardAttendancesUiEvent {
  final DateTime dateTime;
  final Color color;

  CalenderBuilderEvent({
    required this.dateTime,
    required this.color,
  });
}

class RefreshEvent implements StudentDashboardAttendancesUiEvent {
  RefreshEvent();
}
