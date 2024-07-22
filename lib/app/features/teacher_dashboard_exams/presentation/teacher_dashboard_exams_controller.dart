// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_alert_utils.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/entities/teacher_exams.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/ui/teacher_dashboard_exams_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/presentation/ui/teacher_dashboard_exams_ui_state.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/use_cases/teacher_dashboard_exams_use_case.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_default_dialog_widget.dart';

import 'package:qyam_novers_mobile/app/routes/app_pages.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class TeacherDashboardExamsController extends GetxController {
  //region State

  final state = TeacherDashboardExamsUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final TeacherDashboardExamsUseCase _getExamsUseCase;

  //endregion Use Cases

  //region Constructors

  TeacherDashboardExamsController({
    required TeacherDashboardExamsUseCase getExamsUseCase,
  }) : _getExamsUseCase = getExamsUseCase;

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

    state().scrollController.addListener(
      () {
        if (state().scrollController.position.pixels ==
            state().scrollController.position.maxScrollExtent) {
          if (state().pagedList.nextPage != -1 && !state().isLoading) {
            on(
              event: TeacherDashboardExamsUiEvent.getExams(
                studyYear: state().studyYear,
                pageNumber: state().pagedList.pageNumber,
                pageSize: state().pagedList.pageSize,
                status: 'new',
                withPaging: state().pagedList.withPaging,
              ),
            );
          }
        }
      },
    );

    on(
      event: TeacherDashboardExamsUiEvent.getExams(
        studyYear: state().studyYear,
        pageNumber: state().pagedList.pageNumber,
        pageSize: state().pagedList.pageSize,
        status: 'new',
        withPaging: state().pagedList.withPaging,
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
    required TeacherDashboardExamsUiEvent event,
  }) {
    if (event is GetExamsEvent) {
      _getExamsEvent(
        event: event,
      );
    } else if (event is TabbedChangeEvent) {
      _tabbedChangeEvent(
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

    _getExamsEvent(
      event: GetExamsEvent(
        studyYear: state().studyYear,
        pageNumber: state().pagedList.pageNumber,
        pageSize: state().pagedList.pageSize,
        status: state().tabs[state().selectedTab],
        withPaging: state().pagedList.withPaging,
      ),
    );

    state().swipeController.sink.add(SwipeRefreshState.hidden);
  }

  void _getExamsEvent({
    required GetExamsEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _getExamsUseCase.call(
      Params(
        studyYear: event.studyYear,
        pageNumber: event.pageNumber,
        pageSize: event.pageSize,
        status: event.status,
        withPaging: event.withPaging,
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
      (DataState<List<TeacherExams>> dataState) async {
        if (dataState is DoneState) {
          state(
            state().copyWith(
              exmas: dataState.data,
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

  void _tabbedChangeEvent({
    required TabbedChangeEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: false,
        selectedTab: event.selectTab,
      ),
    );

    _getExamsEvent(
      event: GetExamsEvent(
        studyYear: state().studyYear,
        pageNumber: state().pagedList.pageNumber,
        pageSize: state().pagedList.pageSize,
        status: state().tabs[state().selectedTab],
        withPaging: state().pagedList.withPaging,
      ),
    );
  }

  void _toProfileEvent({
    required ToProfileEvent event,
  }) async {
    Get.toNamed(
      AppRoutes.teacherProfile,
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
