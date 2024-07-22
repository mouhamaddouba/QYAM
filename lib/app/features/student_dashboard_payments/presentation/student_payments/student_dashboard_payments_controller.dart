// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_alert_utils.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments_bottom_sheet/student_payments_bottom_sheet_binding.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments_bottom_sheet/student_payments_bottom_sheet_page.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_default_dialog_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/ui/student_dashboard_payments_ui_state.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/ui/student_dashboard_payments_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/use_cases/student_dashboard_payments_use_case.dart';
import 'package:qyam_novers_mobile/app/routes/app_pages.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardPaymentsController extends GetxController {
  //region State

  final state = StudentDashboardPaymentsUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final StudentDashboardPaymentsUseCase _getPaymentsUseCase;

  //endregion Use Cases

  //region Constructors

  StudentDashboardPaymentsController({
    required StudentDashboardPaymentsUseCase getPaymentsUseCase,
  }) : _getPaymentsUseCase = getPaymentsUseCase;

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
              event: StudentDashboardPaymentsUiEvent.getPayments(
                studyYear: state().studyYear,
                pageSize: state().pagedList.pageSize,
                pageNumber: state().pagedList.nextPage,
                withPaging: state().pagedList.withPaging,
              ),
            );
          }
        }
      },
    );

    on(
      event: StudentDashboardPaymentsUiEvent.getPayments(
        studyYear: state().studyYear,
        pageSize: state().pagedList.pageSize,
        pageNumber: state().pagedList.nextPage,
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
    required StudentDashboardPaymentsUiEvent event,
  }) {
    if (event is GetPaymentsEvent) {
      _getPaymentsEvent(
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
    } else if (event is ShowDialogEvent) {
      _showDialogEvent(
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

    _getPaymentsEvent(
      event: GetPaymentsEvent(
        studyYear: state().studyYear,
        pageSize: state().pagedList.pageSize,
        pageNumber: state().pagedList.nextPage,
        withPaging: state().pagedList.withPaging,
      ),
    );

    state().swipeController.sink.add(SwipeRefreshState.hidden);
  }

  void _showDialogEvent({
    required ShowDialogEvent event,
  }) async {
    Get.bottomSheet(
      StudentPaymentsBottomSheetPage(
        bindingCreator: () => StudentPaymentsBottomSheetBinding(),
        studentPaymentData: event.paymentsData,
      ),
    );
  }

  void _getPaymentsEvent({
    required GetPaymentsEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _getPaymentsUseCase.call(
      Params(
        studyYear: event.studyYear,
        pageNumber: event.pageNumber,
        pageSize: event.pageSize,
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
      (DataState<List<StudentPaymentsDataList>> dataState) async {
        if (dataState is DoneState) {
          final newDataList = state().studentPayments;
          newDataList.addAll(
            dataState.data,
          );

          state(
            state().copyWith(
              studentPayments: dataState.data,
              pagedList: dataState.pagedList,
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

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
