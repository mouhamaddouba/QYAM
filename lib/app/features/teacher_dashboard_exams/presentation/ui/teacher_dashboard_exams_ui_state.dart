import 'dart:async';

import 'package:flutter/material.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/entities/teacher_exams.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class TeacherDashboardExamsUiState {
  final List<TeacherExams> exmas;
  final bool isLoading;
  final int selectedTab;
  final ScrollController scrollController;
  final StreamController<SwipeRefreshState> swipeController;
  final PagedList pagedList;
  final String studyYear;
  final List<String> tabs;

  TeacherDashboardExamsUiState({
    required this.isLoading,
    required this.exmas,
    required this.selectedTab,
    required this.scrollController,
    required this.swipeController,
    required this.pagedList,
    required this.studyYear,
    required this.tabs,
  });

  TeacherDashboardExamsUiState.defaultObj()
      : this(
          isLoading: false,
          exmas: [],
          selectedTab: 0,
          scrollController: ScrollController(),
          swipeController: StreamController<SwipeRefreshState>.broadcast(),
          pagedList: PagedList.defaultObj().copyWith(
            pageSize: 10,
          ),
          studyYear: '2023+-+2024',
          tabs: [
            AppStrings.newTab,
            AppStrings.doneTab,
            AppStrings.questionsDelivered,
            AppStrings.answersDelivered,
            AppStrings.markDelivered,
            AppStrings.marksChecked,
          ],
        );

  TeacherDashboardExamsUiState copyWith({
    List<TeacherExams>? exmas,
    bool? isLoading,
    int? selectedTab,
    ScrollController? scrollController,
    StreamController<SwipeRefreshState>? swipeController,
    PagedList? pagedList,
    String? studyYear,
    List<String>? tabs,
  }) =>
      TeacherDashboardExamsUiState(
        exmas: exmas ?? this.exmas,
        isLoading: isLoading ?? this.isLoading,
        selectedTab: selectedTab ?? this.selectedTab,
        scrollController: scrollController ?? this.scrollController,
        swipeController: swipeController ?? this.swipeController,
        pagedList: pagedList ?? this.pagedList,
        studyYear: studyYear ?? this.studyYear,
        tabs: tabs ?? this.tabs,
      );
}
