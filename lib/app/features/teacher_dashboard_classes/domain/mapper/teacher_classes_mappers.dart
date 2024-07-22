import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/domain/entities/teacher_classes.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/data/models/local/teacher_classes_entity.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/data/models/remote/response/teacher_classes_response_dto.dart';

extension TeacherClassesResponseDtoExtensions on TeacherClassesResponseDto {
  TeacherClasses get toDomain => TeacherClasses(
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

  TeacherClassesEntity get toEntity => TeacherClassesEntity(
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

extension TeacherClassesEntityExtensions on TeacherClassesEntity {
  TeacherClasses get toDomain => TeacherClasses(
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

extension ListTeacherClassesResponseDtoExtensions
    on List<TeacherClassesResponseDto> {
  List<TeacherClasses> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<TeacherClassesEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListTeacherClassesEntityExtensions on List<TeacherClassesEntity> {
  List<TeacherClasses> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
