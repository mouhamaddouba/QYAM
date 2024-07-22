import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/models/local/teacher_exams_entity.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/models/remote/response/teacher_exams_response_dto.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/domain/entities/teacher_exams.dart';

extension TeacherExamsExtensions on TeacherExamsResponseDto {
  TeacherExams get toDomain => TeacherExams(
        id: id,
        name: name,
        deletedAt: deletedAt,
        type: type,
        subjectId: subjectId,
        subjectName: subjectName,
        dateAndTime: dateAndTime,
        teacherName: teacherName,
        grade: grade,
        adminNote: adminNote,
        teacherNote: teacherNote,
        maxMark: maxMark,
      );

  TeacherExamsEntity get toEntity => TeacherExamsEntity(
        id: id,
        name: name,
        deletedAt: deletedAt,
        type: type,
        subjectId: subjectId,
        subjectName: subjectName,
        dateAndTime: dateAndTime,
        teacherName: teacherName,
        grade: grade,
        adminNote: adminNote,
        teacherNote: teacherNote,
        maxMark: maxMark,
      );
}

extension TeacherExamsEntityExtensions on TeacherExamsEntity {
  TeacherExams get toDomain => TeacherExams(
        id: id,
        name: name,
        deletedAt: deletedAt,
        type: type,
        subjectId: subjectId,
        subjectName: subjectName,
        dateAndTime: dateAndTime,
        teacherName: teacherName,
        grade: grade,
        adminNote: adminNote,
        teacherNote: teacherNote,
        maxMark: maxMark,
      );
}

extension ListTeacherExamsResponseDtoExtensions
    on List<TeacherExamsResponseDto> {
  List<TeacherExams> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<TeacherExamsEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListTeacherExamsEntityExtensions on List<TeacherExamsEntity> {
  List<TeacherExams> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
