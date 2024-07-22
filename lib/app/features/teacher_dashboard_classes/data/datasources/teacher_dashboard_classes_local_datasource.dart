import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/data/models/local/teacher_classes_entity.dart';

abstract class TeacherDashboardClassesLocaleDatasource {
  Future<void> storeClasses({
    required List<TeacherClassesEntity> dataList,
  });

  Future<List<TeacherClassesEntity>> getClasses();
}

class TeacherDashboardClassesLocalDatasourceImpl
    implements TeacherDashboardClassesLocaleDatasource {
  static const String _dataListKey = 'ClassesDataList';
  @override
  Future<List<TeacherClassesEntity>> getClasses() async {
    final List<TeacherClassesEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => TeacherClassesEntity(
              id: element.id,
              durationId: element.durationId,
              studyYear: element.studyYear,
              day: element.day,
              dayLabel: element.dayLabel,
              groupId: element.groupId,
              subjectId: element.subjectId,
              subjectName: element.subjectName,
              groupFullName: element.groupFullName,
              teacherId: element.teacherId,
              deletedAt: element.deletedAt,
              duration: element.duration,
              teacherName: element.teacherName,
              groupName: element.groupName,
              studyLevelName: element.studyLevelName,
              groupGender: element.groupGender,
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
  Future<void> storeClasses({
    required List<TeacherClassesEntity> dataList,
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
