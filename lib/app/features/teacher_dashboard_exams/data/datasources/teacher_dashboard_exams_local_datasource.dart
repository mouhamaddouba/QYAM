import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/models/local/teacher_exams_entity.dart';

abstract class TeacherDashboardExamsLocaleDatasource {
  Future<void> storeExams({
    required List<TeacherExamsEntity> dataList,
  });

  Future<List<TeacherExamsEntity>> getExams();
}

class TeacherDashboardExamsLocalDatasourceImpl
    implements TeacherDashboardExamsLocaleDatasource {
  static const String _dataListKey = 'ExamsDataList';

  @override
  Future<List<TeacherExamsEntity>> getExams() async {
    final List<TeacherExamsEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => TeacherExamsEntity(
              id: element.id,
              name: element.name,
              deletedAt: element.deletedAt,
              type: element.type,
              subjectId: element.subjectId,
              subjectName: element.subjectName,
              dateAndTime: element.dateAndTime,
              teacherName: element.teacherName,
              grade: element.grade,
              adminNote: element.adminNote,
              teacherNote: element.teacherNote,
              maxMark: element.maxMark,
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
  Future<void> storeExams({
    required List<TeacherExamsEntity> dataList,
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
