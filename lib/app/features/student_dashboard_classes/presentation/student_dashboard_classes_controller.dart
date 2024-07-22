// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/routes/app_pages.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_alert_utils.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_default_dialog_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/entities/student_classes.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/ui/student_dashboard_classes_ui_state.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/ui/student_dashboard_classes_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/use_cases/student_dashboard_classes_use_case.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardClassesController extends GetxController {
  //region State

  final state = StudentDashboardClassesUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final StudentDashboardClassesUseCase _getClassesUseCase;

  //endregion Use Cases

  //region Constructors

  StudentDashboardClassesController({
    required StudentDashboardClassesUseCase getClassesUseCase,
  }) : _getClassesUseCase = getClassesUseCase;

  //endregion Constructors

  //region Lifecycle

  @override
  InternalFinalCallback<void> get onStart {
    return super.onStart;
  }

  @override
  void onInit() {
    super.onInit();

    _workers();
    _processArguments();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      state().scrollController.animateTo(
            state().scrollController.position.maxScrollExtent,
            duration: Duration(
              seconds: AppConstants.duration02,
            ),
            curve: Curves.ease,
          );
    });

    on(
      event: StudentDashboardClassesUiEvent.getClasses(
        isStudent: true,
        studyYear: state().studyYear,
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    return super.onDelete;
  }

  //endregion Lifecycle

  //region Public functions

  void on({
    required StudentDashboardClassesUiEvent event,
  }) {
    if (event is SelectDaysEvent) {
      _selectDaysEvent(
        event: event,
      );
    } else if (event is GetClassesEvent) {
      _getClassesEvent(
        event: event,
      );
    } else if (event is ToNotificationEvent) {
      _toNotificationEvent(
        event: event,
      );
    } else if (event is ToProfileEvent) {
      _toProfileEvent(
        event: event,
      );
    } else if (event is FilterClassesByDayEvent) {
      _filterClassesByDayEvent(
        event: event,
      );
    } else if (event is RefreshEvent) {
      _refreshEvent(
        event: event,
      );
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _selectDaysEvent({
    required SelectDaysEvent event,
  }) async {
    state(
      state().copyWith(
        selectedDay: event.dayId,
      ),
    );
  }

  void _refreshEvent({
    required RefreshEvent event,
  }) async {
    await Future<void>.delayed(
      const Duration(
        seconds: AppConstants.refreshDelay,
      ),
    );

    _getClassesEvent(
      event: GetClassesEvent(
        isStudent: true,
        studyYear: state().studyYear,
      ),
    );

    state().swipeController.sink.add(SwipeRefreshState.hidden);
  }

  void _getClassesEvent({
    required GetClassesEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _getClassesUseCase.call(
      Params(
        studyYear: event.studyYear,
        isStudent: event.isStudent,
      ),
    );

    result.fold(
      (Failure failure) {
        AppAlertUtils.showDialog(
          title: AppStrings.alertError.tr,
          message: failure.message,
          dialogTypeEnum: DialogTypeEnum.error,
          textConfirm: AppStrings.ok.tr,
          onConfirm: () {
            Get.back();
          },
        );

        state(
          state().copyWith(
            isLoading: false,
          ),
        );
      },
      (DataState<List<StudentClasses>> dataState) async {
        if (dataState is DoneState) {
          state(
            state().copyWith(
              dayClasses: dataState.data,
              isLoading: false,
            ),
          );

          _filterClassesByDayEvent(
            event: FilterClassesByDayEvent(
              filteredData: state().filteredData,
            ),
          );

          if (dataState.failure != null) {
            AppAlertUtils.showDialog(
              title: AppStrings.alertError.tr,
              message: dataState.failure?.message ?? '',
              dialogTypeEnum: DialogTypeEnum.error,
              textConfirm: AppStrings.ok.tr,
              onConfirm: () {
                Get.back();
              },
            );
          }
        }
      },
    );
  }

  void _filterClassesByDayEvent({
    required FilterClassesByDayEvent event,
  }) async {
    List<StudentClasses> filteredData = [];

    filteredData = state().dayClasses.where(
      (element) {
        return element.dayLabel == state().weekDaysConst[state().selectedDay];
      },
    ).toList();

    state(
      state().copyWith(
        filteredData: filteredData,
      ),
    );
  }

  void _toProfileEvent({
    required ToProfileEvent event,
  }) async {
    Get.toNamed(
      AppRoutes.studentProfile,
    );
  }

  void _toNotificationEvent({
    required ToNotificationEvent event,
  }) async {
    Get.toNamed(
      AppRoutes.notifications,
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
