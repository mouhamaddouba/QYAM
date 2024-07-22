import 'dart:async';

import 'package:flutter/material.dart';

import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/entities/teacher_lates.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class TeacherDashboardLatesUiState {
  final List<TeacherLates> lates;
  final ScrollController scrollController;
  final StreamController<SwipeRefreshState> swipeController;
  final PagedList pagedList;
  final String studyYear;
  final String fromDate;
  final String toDate;
  final bool isLoading;

  TeacherDashboardLatesUiState({
    required this.isLoading,
    required this.lates,
    required this.scrollController,
    required this.swipeController,
    required this.pagedList,
    required this.studyYear,
    required this.fromDate,
    required this.toDate,
  });

  TeacherDashboardLatesUiState.defaultObj()
      : this(
          isLoading: false,
          lates: [],
          scrollController: ScrollController(),
          swipeController: StreamController<SwipeRefreshState>.broadcast(),
          pagedList: PagedList.defaultObj().copyWith(
            pageSize: 10,
          ),
          studyYear: '2023+-+2024',
          fromDate: '',
          toDate: '',
        );

  TeacherDashboardLatesUiState copyWith({
    List<TeacherLates>? lates,
    ScrollController? scrollController,
    StreamController<SwipeRefreshState>? swipeController,
    PagedList? pagedList,
    String? studyYear,
    String? fromDate,
    String? toDate,
    bool? isLoading,
  }) =>
      TeacherDashboardLatesUiState(
        lates: lates ?? this.lates,
        isLoading: isLoading ?? this.isLoading,
        scrollController: scrollController ?? this.scrollController,
        swipeController: swipeController ?? this.swipeController,
        pagedList: pagedList ?? this.pagedList,
        studyYear: studyYear ?? this.studyYear,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
      );
}
