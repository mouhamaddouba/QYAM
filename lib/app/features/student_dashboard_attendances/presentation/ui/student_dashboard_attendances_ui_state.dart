import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/entities/student_attendances.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardAttendancesUiState {
  final List<StudentAttendances> attendances;
  final List<StudentAttendances> filterAttendances;
  final StreamController<SwipeRefreshState> swipeController;
  final DateTime calenderFirstDay;
  final DateTime calenderLastDay;
  final DateTime calenderFocusedDay;
  final DateTime? selectDate;
  final String studyYear;
  final String note;
  final int month;
  final int year;
  final bool isLoading;
  final Color color;

  StudentDashboardAttendancesUiState({
    required this.attendances,
    required this.filterAttendances,
    required this.calenderFirstDay,
    required this.calenderLastDay,
    required this.calenderFocusedDay,
    required this.selectDate,
    required this.isLoading,
    required this.studyYear,
    required this.month,
    required this.year,
    required this.note,
    required this.color,
    required this.swipeController,
  });

  StudentDashboardAttendancesUiState.defaultObj()
      : this(
          attendances: [],
          filterAttendances: [],
          calenderFirstDay: DateTime(2022, 8, 1),
          year: DateTime.now().year,
          month: DateTime.now().month,
          calenderLastDay: DateTime.now().add(
            const Duration(
              days: AppConstants.lastDayDelay,
            ),
          ),
          calenderFocusedDay: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            1,
          ),
          selectDate: DateTime.now(),
          isLoading: false,
          studyYear: '2023+-+2024',
          note: '',
          color: AppColors.secondaryContainer,
          swipeController: StreamController<SwipeRefreshState>.broadcast(),
        );

  StudentDashboardAttendancesUiState copyWith({
    List<StudentAttendances>? attendances,
    List<StudentAttendances>? filterAttendances,
    StreamController<SwipeRefreshState>? swipeController,
    DateTime? calenderFirstDay,
    DateTime? calenderLastDay,
    DateTime? calenderFocusedDay,
    DateTime? selectDate,
    String? studyYear,
    String? note,
    int? month,
    int? year,
    bool? isLoading,
    Color? color,
  }) =>
      StudentDashboardAttendancesUiState(
        attendances: attendances ?? this.attendances,
        filterAttendances: filterAttendances ?? this.filterAttendances,
        calenderFirstDay: calenderFirstDay ?? this.calenderFirstDay,
        calenderLastDay: calenderLastDay ?? this.calenderLastDay,
        calenderFocusedDay: calenderFocusedDay ?? this.calenderFocusedDay,
        swipeController: swipeController ?? this.swipeController,
        selectDate: selectDate,
        isLoading: isLoading ?? this.isLoading,
        studyYear: studyYear ?? this.studyYear,
        month: month ?? this.month,
        year: year ?? this.year,
        note: note ?? this.note,
        color: color ?? this.color,
      );
}
