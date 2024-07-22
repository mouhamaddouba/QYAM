import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/domain/entities/student_classes.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/models/local/student_classes_entity.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/models/remote/response/student_classes_response_dto.dart';

extension StudentClassesResponseDtoExtensions on StudentClassesResponseDto {
  StudentClasses get toDomain => StudentClasses(
        id: id,
        durationId: durationId,
        studyYear: studyYear,
        day: day,
        dayLabel: dayLabel,
        groupId: groupId,
        subjectId: subjectId,
        groupFullName: groupFullName,
        subjectName: subjectName,
        teacherId: teacherId,
        deletedAt: deletedAt,
        duration: duration,
        teacherName: teacherName,
        groupName: groupName,
        studyLevelName: studyLevelName,
        groupGender: groupGender,
      );

  StudentClassesEntity get toEntity => StudentClassesEntity(
        id: id,
        durationId: durationId,
        studyYear: studyYear,
        day: day,
        dayLabel: dayLabel,
        groupId: groupId,
        subjectId: subjectId,
        groupFullName: groupFullName,
        subjectName: subjectName,
        teacherId: teacherId,
        deletedAt: deletedAt,
        duration: duration,
        teacherName: teacherName,
        groupName: groupName,
        studyLevelName: studyLevelName,
        groupGender: groupGender,
      );
}

extension StudentClassesEntityExtensions on StudentClassesEntity {
  StudentClasses get toDomain => StudentClasses(
        id: id,
        durationId: durationId,
        studyYear: studyYear,
        day: day,
        dayLabel: dayLabel,
        groupId: groupId,
        subjectId: subjectId,
        groupFullName: groupFullName,
        subjectName: subjectName,
        teacherId: teacherId,
        deletedAt: deletedAt,
        duration: duration,
        teacherName: teacherName,
        groupName: groupName,
        studyLevelName: studyLevelName,
        groupGender: groupGender,
      );
}

extension ListStudentClassesResponseDtoExtensions
    on List<StudentClassesResponseDto> {
  List<StudentClasses> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<StudentClassesEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListStudentClassesEntityExtensions on List<StudentClassesEntity> {
  List<StudentClasses> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
