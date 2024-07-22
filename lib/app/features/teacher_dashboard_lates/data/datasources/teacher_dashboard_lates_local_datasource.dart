import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/models/local/teacher_lates_entity.dart';

abstract class TeacherDashboardLatesLocaleDatasource {
  Future<void> storeLates({
    required List<TeacherLatesEntity> dataList,
  });

  Future<List<TeacherLatesEntity>> getLates();
}

class TeacherDashboardLatesLocalDatasourceImpl
    implements TeacherDashboardLatesLocaleDatasource {
  static const String _dataListKey = 'LatesDataList';
  @override
  Future<List<TeacherLatesEntity>> getLates() async {
    final List<TeacherLatesEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => TeacherLatesEntity(
              id: element.id,
              minutes: element.minutes,
              dateAndTime: element.dateAndTime,
              teacherId: element.teacherId,
              day: element.day,
              deletedAt: element.deletedAt,
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
  Future<void> storeLates({
    required List<TeacherLatesEntity> dataList,
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
