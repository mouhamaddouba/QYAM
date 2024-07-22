// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/data/data_state.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_alert_utils.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_arguments_keys.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';
import 'package:qyam_novers_mobile/app/features/notifications/domain/use_cases/notifications_use_case.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/ui/notifications_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/ui/notifications_ui_state.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_default_dialog_widget.dart';

import 'package:qyam_novers_mobile/app/routes/app_pages.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class NotificationsController extends GetxController {
  //region State

  final state = NotificationsUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final NotificationsUseCase _getNotificationsUseCase;

  //endregion Use Cases

  //region Constructors

  NotificationsController({
    required NotificationsUseCase getNotificationsUseCase,
  }) : _getNotificationsUseCase = getNotificationsUseCase;

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
              event: NotificationsUiEvent.getNotification(
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
      event: NotificationsUiEvent.getNotification(
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
    required NotificationsUiEvent event,
  }) {
    if (event is GetNotificationEvent) {
      _getNotificationEvent(
        event: event,
      );
    } else if (event is BacktoClassesPageEvent) {
      _backtoClassesPageEvent(
        event: event,
      );
    } else if (event is LogoutEvent) {
      _logoutEvent(
        event: event,
      );
    } else if (event is ToNotificationsDetailsEvent) {
      _toNotificationsDetailsEvent(
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

    _getNotificationEvent(
      event: GetNotificationEvent(
        studyYear: state().studyYear,
        pageSize: state().pagedList.pageSize,
        pageNumber: state().pagedList.nextPage,
        withPaging: state().pagedList.withPaging,
      ),
    );

    state().swipeController.sink.add(SwipeRefreshState.hidden);
  }

  void _getNotificationEvent({
    required GetNotificationEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _getNotificationsUseCase.call(
      Params(
        studyYear: event.studyYear,
        pageSize: event.pageSize,
        pageNumber: event.pageNumber,
        withPaging: event.withPaging,
      ),
    );

    result.fold(
      (Failure failure) {
        AppAlertUtils.showDialog(
          title: AppStrings.alertWarning.tr,
          message: failure.message,
          dialogTypeEnum: DialogTypeEnum.warning,
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
      (DataState<List<NotificationsData>> dataState) async {
        if (dataState is DoneState) {
          final newDataList = state().notifications;
          newDataList.addAll(
            dataState.data,
          );

          state(
            state().copyWith(
              notifications: dataState.data,
              pagedList: dataState.pagedList,
              isLoading: false,
            ),
          );

          if (dataState.failure != null) {
            AppAlertUtils.showDialog(
              title: AppStrings.alertWarning.tr,
              message: dataState.failure?.message ?? '',
              dialogTypeEnum: DialogTypeEnum.warning,
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

  void _backtoClassesPageEvent({
    required BacktoClassesPageEvent event,
  }) {
    Get.back();
  }

  void _logoutEvent({
    required LogoutEvent event,
  }) async {
    AppAlertUtils.showDialog(
      title: AppStrings.logoutAlert.tr,
      textConfirm: AppStrings.confirm.tr,
      onConfirm: () {
        AppStorage.removeAll();

        Get.offNamed(
          AppRoutes.splash,
        );
      },
      textCancel: AppStrings.cancel.tr,
      onCancel: () {
        Get.back();
      },
    );
  }

  void _toNotificationsDetailsEvent({
    required ToNotificationsDetailsEvent event,
  }) async {
    Get.toNamed(
      AppRoutes.notificationsDetails,
      arguments: {
        AppArgumentsKeys.notificationId: event.notificationsData,
      },
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
