// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments_bottom_sheet/ui/student_payments_bottom_sheet_ui_state.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/ui/student_dashboard_payments_ui_event.dart';

class StudentPaymentsBottomSheetController extends GetxController {
  //region State

  final state = StudentPaymentsBottomSheetUiState.defaultObj().obs;

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
    required StudentDashboardPaymentsUiEvent event,
  }) {}

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
