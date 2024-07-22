// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_alert_utils.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/entities/student_attendances.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/ui/student_dashboard_attendances_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/ui/student_dashboard_attendances_ui_state.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/use_cases/student_dashboard_attendances_use_case.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_default_dialog_widget.dart';

import 'package:qyam_novers_mobile/app/routes/app_pages.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardAttendancesController extends GetxController {
  //region State

  final state = StudentDashboardAttendancesUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final StudentDashboardAttendancesUseCase _getAttendancesUseCase;

  //endregion Use Cases

  //region Constructors

  StudentDashboardAttendancesController({
    required StudentDashboardAttendancesUseCase getAttendancesUseCase,
  }) : _getAttendancesUseCase = getAttendancesUseCase;

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

    on(
      event: StudentDashboardAttendancesUiEvent.getAttendances(
        studyYear: state().studyYear,
        year: state().year.toString(),
        month: state().month.toString(),
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
    required StudentDashboardAttendancesUiEvent event,
  }) {
    if (event is SelectDateEvent) {
      _selectDateEvent(
        event: event,
      );
    } else if (event is GetAttendancesEvent) {
      _getAttendancesEvent(
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
    } else if (event is PageCalenderChangedEvent) {
      _pageCalenderChangedEvent(
        event: event,
      );
    } else if (event is CalenderBuilderEvent) {
      _calenderBuilderEvent(
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

  void _refreshEvent({
    required RefreshEvent event,
  }) async {
    await Future<void>.delayed(
      const Duration(
        seconds: AppConstants.refreshDelay,
      ),
    );

    _getAttendancesEvent(
      event: GetAttendancesEvent(
        studyYear: state().studyYear,
        year: state().year.toString(),
        month: state().month.toString(),
      ),
    );

    state().swipeController.sink.add(SwipeRefreshState.hidden);
  }

  void _pageCalenderChangedEvent({
    required PageCalenderChangedEvent event,
  }) async {
    state().attendances.clear();
    state(
      state().copyWith(
        month: event.monthChange,
        year: event.yearChange,
        calenderFocusedDay: DateTime(
          event.yearChange,
          event.monthChange,
        ),
      ),
    );
  }

  void _selectDateEvent({
    required SelectDateEvent event,
  }) async {
    StudentAttendances day = state().attendances.singleWhere((element) {
      return element.day == event.selectDateId.day;
    });

    if (state().selectDate == event.selectDateId) {
      state(
        state().copyWith(
          selectDate: null,
          note: AppConstants.emptyText,
        ),
      );
    } else {
      state(
        state().copyWith(
          selectDate: event.selectDateId,
          note: day.note,
        ),
      );
    }
  }

  void _getAttendancesEvent({
    required GetAttendancesEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _getAttendancesUseCase.call(
      Params(
        studyYear: event.studyYear,
        year: event.year,
        month: event.month,
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
      (DataState<List<StudentAttendances>> dataState) async {
        if (dataState is DoneState) {
          state(
            state().copyWith(
              attendances: dataState.data,
              isLoading: false,
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

  void _calenderBuilderEvent({
    required CalenderBuilderEvent event,
  }) async {
    if (state().attendances.any(
          (element) => element.day == event.dateTime.day + 1,
        )) {
      final attendance = state().attendances.singleWhere(
            (element) => element.day == event.dateTime.day,
          );
      if (attendance.value == "p") {
        state(
          state().copyWith(
            color: Colors.green.withOpacity(.5),
          ),
        );
      } else if (attendance.value != "NA") {
        state(
          state().copyWith(
            color: Colors.red.withOpacity(.5),
          ),
        );
      }
    }
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
