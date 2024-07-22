import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/models/local/student_attendances_entity.dart';

abstract class StudentDashboardAttendancesLocaleDatasource {
  Future<void> storeAttendances({
    required List<StudentAttendancesEntity> dataList,
  });

  Future<List<StudentAttendancesEntity>> getAttendances();
}

class StudentDashboardAttendancesLocalDatasourceImpl
    implements StudentDashboardAttendancesLocaleDatasource {
  static const String _dataListKey = 'AttendancesDataList';

  @override
  Future<List<StudentAttendancesEntity>> getAttendances() async {
    final List<StudentAttendancesEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => StudentAttendancesEntity(
              id: element.id,
              deletedAt: element.deletedAt,
              value: element.value,
              note: element.note,
              dateAndTime: element.dateAndTime,
              durationId: element.durationId,
              day: element.day,
              dayOfWeek: element.dayOfWeek,
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
  Future<void> storeAttendances({
    required List<StudentAttendancesEntity> dataList,
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
