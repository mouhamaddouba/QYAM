import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/models/local/student_payments_entity.dart';

abstract class StudentDashboardPaymentsLocaleDatasource {
  Future<void> storePayments({
    required List<StudentPaymentDataListEntity> dataList,
  });

  Future<List<StudentPaymentDataListEntity>> getPayments();
}

class StudentDashboardPaymentsLocalDatasourceImpl
    implements StudentDashboardPaymentsLocaleDatasource {
  static const String _dataListKey = 'PaymentDataList';

  @override
  Future<List<StudentPaymentDataListEntity>> getPayments() async {
    final List<StudentPaymentDataListEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => StudentPaymentDataListEntity(
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
    required List<StudentPaymentDataListEntity> dataList,
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
