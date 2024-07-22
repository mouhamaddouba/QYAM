import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class NotificationsUiState {
  final List<NotificationsData> notifications;
  final bool isLoading;
  final ScrollController scrollController;
  final StreamController<SwipeRefreshState> swipeController;
  final PagedList pagedList;
  final String studyYear;

  NotificationsUiState({
    required this.isLoading,
    required this.notifications,
    required this.scrollController,
    required this.swipeController,
    required this.pagedList,
    required this.studyYear,
  });

  NotificationsUiState.defaultObj()
      : this(
          isLoading: false,
          notifications: [],
          scrollController: ScrollController(),
          swipeController: StreamController<SwipeRefreshState>.broadcast(),
          pagedList: PagedList.defaultObj().copyWith(
            pageSize: 10,
          ),
          studyYear: '2023+-+2024',
        );

  NotificationsUiState copyWith({
    List<NotificationsData>? notifications,
    bool? isLoading,
    ScrollController? scrollController,
    StreamController<SwipeRefreshState>? swipeController,
    PagedList? pagedList,
    String? studyYear,
  }) =>
      NotificationsUiState(
        notifications: notifications ?? this.notifications,
        isLoading: isLoading ?? this.isLoading,
        scrollController: scrollController ?? this.scrollController,
        swipeController: swipeController ?? this.swipeController,
        pagedList: pagedList ?? this.pagedList,
        studyYear: studyYear ?? this.studyYear,
      );
}
