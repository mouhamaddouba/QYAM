// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/ui/teacher_dashboard_payments_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments_bottom_sheet/ui/teacher_payments_bottom_sheet_ui_state.dart';

class TeacherPaymentsBottomSheetController extends GetxController {
  //region State

  final state = TeacherPaymentsBottomSheetUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  //endregion Use Cases

  //region Constructors

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
    required TeacherDashboardPaymentsUiEvent event,
  }) {}

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
