import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/data/models/local/student_exams_entity.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/data/models/remote/response/student_exams_response_dto.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_exams/domain/entities/student_exams.dart';

extension StudentExamsExtensions on StudentExamsResponseDto {
  StudentExams get toDomain => StudentExams(
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

  StudentExamsEntity get toEntity => StudentExamsEntity(
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

extension StudentExamsEntityExtensions on StudentExamsEntity {
  StudentExams get toDomain => StudentExams(
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

extension ListStudentExamsResponseDtoExtensions
    on List<StudentExamsResponseDto> {
  List<StudentExams> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<StudentExamsEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListStudentExamsEntityExtensions on List<StudentExamsEntity> {
  List<StudentExams> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
