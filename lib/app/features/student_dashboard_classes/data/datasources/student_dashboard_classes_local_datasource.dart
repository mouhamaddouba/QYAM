import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/models/local/student_classes_entity.dart';

abstract class StudentDashboardClassesLocaleDatasource {
  Future<void> storeClasses({
    required List<StudentClassesEntity> dataList,
  });

  Future<List<StudentClassesEntity>> getClasses();
}

class StudentDashboardClassesLocalDatasourceImpl
    implements StudentDashboardClassesLocaleDatasource {
  static const String _dataListKey = 'ClassesDataList';

  @override
  Future<List<StudentClassesEntity>> getClasses() async {
    final List<StudentClassesEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => StudentClassesEntity(
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
    required List<StudentClassesEntity> dataList,
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
