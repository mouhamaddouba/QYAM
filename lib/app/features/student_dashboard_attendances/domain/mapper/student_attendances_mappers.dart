import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/domain/entities/student_attendances.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/models/local/student_attendances_entity.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/models/remote/response/student_attendances_response_dto.dart';

extension StudentAttendancesResponseDtoExtensions
    on StudentAttendancesResponseDto {
  StudentAttendances get toDomain => StudentAttendances(
        id: id,
        deletedAt: deletedAt,
        value: value,
        note: note,
        dateAndTime: dateAndTime,
        durationId: durationId,
        day: day,
        dayOfWeek: dayOfWeek,
      );

  StudentAttendancesEntity get toEntity => StudentAttendancesEntity(
        id: id,
        deletedAt: deletedAt,
        value: value,
        note: note,
        dateAndTime: dateAndTime,
        durationId: durationId,
        day: day,
        dayOfWeek: dayOfWeek,
      );
}

extension StudentAttendancesEntityExtensions on StudentAttendancesEntity {
  StudentAttendances get toDomain => StudentAttendances(
        id: id,
        deletedAt: deletedAt,
        value: value,
        note: note,
        dateAndTime: dateAndTime,
        durationId: durationId,
        day: day,
        dayOfWeek: dayOfWeek,
      );
}

extension ListStudentAttendancesResponseDtoExtensions
    on List<StudentAttendancesResponseDto> {
  List<StudentAttendances> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<StudentAttendancesEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListStudentAttendancesEntityExtensions
    on List<StudentAttendancesEntity> {
  List<StudentAttendances> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
