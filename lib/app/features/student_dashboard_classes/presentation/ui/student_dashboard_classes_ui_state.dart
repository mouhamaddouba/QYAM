import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/entities/student_classes.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardClassesUiState {
  final List<StudentClasses> dayClasses;
  final List<StudentClasses> filteredData;
  final ScrollController scrollController;
  final StreamController<SwipeRefreshState> swipeController;
  final List weekDaysConst;
  final String dayName;
  final String studyYear;
  final int selectedDay;
  final bool isLoading;

  List get weekDays => [
        AppStrings.saturday.tr,
        AppStrings.sunday.tr,
        AppStrings.monday.tr,
        AppStrings.tuesday.tr,
        AppStrings.wednesday.tr,
        AppStrings.thursday.tr,
        AppStrings.friday.tr,
      ];

  StudentDashboardClassesUiState({
    required this.dayClasses,
    required this.filteredData,
    required this.scrollController,
    required this.swipeController,
    required this.weekDaysConst,
    required this.selectedDay,
    required this.isLoading,
    required this.dayName,
    required this.studyYear,
  });

  StudentDashboardClassesUiState.defaultObj()
      : this(
          dayClasses: [],
          filteredData: [],
          scrollController: ScrollController(),
          swipeController: StreamController<SwipeRefreshState>.broadcast(),
          weekDaysConst: [
            'السبت',
            'الأحد',
            'الإثنين',
            'الثلاثاء',
            'الأربعاء',
            'الخميس',
            'الجمعة',
          ],
          selectedDay:
              DateTime.now().weekday == 7 ? 0 : DateTime.now().weekday + 1,
          isLoading: false,
          dayName: '',
          studyYear: '2023+-+2024',
        );

  StudentDashboardClassesUiState copyWith({
    List<StudentClasses>? dayClasses,
    List<StudentClasses>? filteredData,
    ScrollController? scrollController,
    StreamController<SwipeRefreshState>? swipeController,
    List? weekDaysConst,
    String? dayName,
    String? studyYear,
    int? selectedDay,
    bool? isLoading,
  }) =>
      StudentDashboardClassesUiState(
        dayClasses: dayClasses ?? this.dayClasses,
        filteredData: filteredData ?? this.filteredData,
        scrollController: scrollController ?? this.scrollController,
        swipeController: swipeController ?? this.swipeController,
        weekDaysConst: weekDaysConst ?? this.weekDaysConst,
        selectedDay: selectedDay ?? this.selectedDay,
        isLoading: isLoading ?? this.isLoading,
        dayName: dayName ?? this.dayName,
        studyYear: studyYear ?? this.studyYear,
      );
}
