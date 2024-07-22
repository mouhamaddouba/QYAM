import 'dart:async';

import 'package:flutter/material.dart';

import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardPaymentsUiState {
  final List<StudentPayments> payments;
  final List<StudentPaymentsDataList> studentPayments;
  final ScrollController scrollController;
  final StreamController<SwipeRefreshState> swipeController;
  final PagedList pagedList;
  final String studyYear;
  final bool isLoading;
  final int categoryId;

  StudentDashboardPaymentsUiState({
    required this.payments,
    required this.studentPayments,
    required this.isLoading,
    required this.pagedList,
    required this.scrollController,
    required this.swipeController,
    required this.studyYear,
    required this.categoryId,
  });

  StudentDashboardPaymentsUiState.defaultObj()
      : this(
          payments: [],
          studentPayments: [],
          isLoading: false,
          pagedList: PagedList.defaultObj().copyWith(
            pageSize: 10,
          ),
          scrollController: ScrollController(),
          swipeController: StreamController<SwipeRefreshState>.broadcast(),
          studyYear: '2023+-+2024',
          categoryId: -1,
        );

  StudentDashboardPaymentsUiState copyWith({
    List<StudentPayments>? payments,
    List<StudentPaymentsDataList>? studentPayments,
    StreamController<SwipeRefreshState>? swipeController,
    ScrollController? scrollController,
    PagedList? pagedList,
    String? studyYear,
    bool? isLoading,
    int? categoryId,
  }) =>
      StudentDashboardPaymentsUiState(
        payments: payments ?? this.payments,
        studentPayments: studentPayments ?? this.studentPayments,
        isLoading: isLoading ?? this.isLoading,
        pagedList: pagedList ?? this.pagedList,
        scrollController: scrollController ?? this.scrollController,
        swipeController: swipeController ?? this.swipeController,
        studyYear: studyYear ?? this.studyYear,
        categoryId: categoryId ?? this.categoryId,
      );
}
