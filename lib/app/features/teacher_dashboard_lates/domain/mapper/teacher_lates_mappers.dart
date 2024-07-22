import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/models/local/teacher_lates_entity.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/models/remote/response/teacher_lates_response_dto.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/entities/teacher_lates.dart';

extension TeacherLatesResponseDtoExtensions on TeacherLatesResponseDto {
  TeacherLates get toDomain => TeacherLates(
        id: id,
        minutes: minutes,
        dateAndTime: dateAndTime,
        teacherId: teacherId,
        day: day,
        deletedAt: deletedAt,
      );

  TeacherLatesEntity get toEntity => TeacherLatesEntity(
        id: id,
        minutes: minutes,
        dateAndTime: dateAndTime,
        teacherId: teacherId,
        day: day,
        deletedAt: deletedAt,
      );
}

extension TeacherLatesEntityExtensions on TeacherLatesEntity {
  TeacherLates get toDomain => TeacherLates(
        id: id,
        minutes: minutes,
        dateAndTime: dateAndTime,
        teacherId: teacherId,
        day: day,
        deletedAt: deletedAt,
      );
}

extension ListTeacherLatesResponseDtoExtensions
    on List<TeacherLatesResponseDto> {
  List<TeacherLates> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<TeacherLatesEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListStudentLatesEntityExtensions on List<TeacherLatesEntity> {
  List<TeacherLates> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
