import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/data/models/local/teacher_payments_entity.dart';

abstract class TeacherDashboardPaymentsLocaleDatasource {
  Future<void> storePayments({
    required List<TeacherPaymentDataListEntity> dataList,
  });

  Future<List<TeacherPaymentDataListEntity>> getPayments();
}

class TeacherDashboardPaymentsLocalDatasourceImpl
    implements TeacherDashboardPaymentsLocaleDatasource {
  static const String _dataListKey = 'PaymentDataList';

  @override
  Future<List<TeacherPaymentDataListEntity>> getPayments() async {
    final List<TeacherPaymentDataListEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => TeacherPaymentDataListEntity(
              dateAndTime: element.dateAndTime,
              deletedAt: element.deletedAt,
              id: element.id,
              notes: element.notes,
              pay: element.pay,
              payNo: element.payNo,
              shouldPaidDate: element.shouldPaidDate,
              studyYear: element.studyYear,
            ),
          )
          .toList();

      return dataList;
    } on Exception catch (exception) {
      throw LocalException(
        message: exception.toString(),
      );
    }
  }

  @override
  Future<void> storePayments({
    required List<TeacherPaymentDataListEntity> dataList,
  }) async {
    try {
      await AppStorage.write(
        _dataListKey,
        dataList,
      );
    } on Exception catch (exception) {
      throw LocalException(
        message: exception.toString(),
      );
    }
  }
}
