import 'dart:async';

import 'package:flutter/material.dart';

import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/entities/teacher_payments.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class TeacherDashboardPaymentsUiState {
  final List<TeacherPaymentsDataList> payments;
  final List<TeacherPaymentsDataList> teacherPayments;
  final ScrollController scrollController;
  final StreamController<SwipeRefreshState> swipeController;
  final PagedList pagedList;
  final String studyYear;
  final bool isLoading;
  final int categoryId;

  TeacherDashboardPaymentsUiState({
    required this.payments,
    required this.teacherPayments,
    required this.isLoading,
    required this.pagedList,
    required this.scrollController,
    required this.swipeController,
    required this.studyYear,
    required this.categoryId,
  });

  TeacherDashboardPaymentsUiState.defaultObj()
      : this(
          payments: [],
          teacherPayments: [],
          isLoading: false,
          pagedList: PagedList.defaultObj().copyWith(
            pageSize: 10,
          ),
          scrollController: ScrollController(),
          swipeController: StreamController<SwipeRefreshState>.broadcast(),
          studyYear: '2023+-+2024',
          categoryId: -1,
        );

  TeacherDashboardPaymentsUiState copyWith({
    List<TeacherPaymentsDataList>? payments,
    List<TeacherPaymentsDataList>? teacherPayments,
    ScrollController? scrollController,
    StreamController<SwipeRefreshState>? swipeController,
    PagedList? pagedList,
    String? studyYear,
    bool? isLoading,
    int? categoryId,
  }) =>
      TeacherDashboardPaymentsUiState(
        payments: payments ?? this.payments,
        teacherPayments: teacherPayments ?? this.teacherPayments,
        isLoading: isLoading ?? this.isLoading,
        pagedList: pagedList ?? this.pagedList,
        scrollController: scrollController ?? this.scrollController,
        swipeController: swipeController ?? this.swipeController,
        studyYear: studyYear ?? this.studyYear,
        categoryId: categoryId ?? this.categoryId,
      );
}
