import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/entities/teacher_payments.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/data/models/local/teacher_payments_entity.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/data/models/remote/response/teacher_payments_response_dto.dart';

extension TeacherPaymentResponseDtoExtensions
    on TeacherPaymentDataListResponseDto {
  TeacherPaymentsDataList get toDomain => TeacherPaymentsDataList(
        dateAndTime: dateAndTime,
        deletedAt: deletedAt,
        id: id,
        notes: notes,
        pay: pay,
        payNo: payNo,
        shouldPaidDate: shouldPaidDate,
        studyYear: studyYear,
      );

  TeacherPaymentDataListEntity get toEntity => TeacherPaymentDataListEntity(
        dateAndTime: dateAndTime,
        deletedAt: deletedAt,
        id: id,
        notes: notes,
        pay: pay,
        payNo: payNo,
        shouldPaidDate: shouldPaidDate,
        studyYear: studyYear,
      );
}

extension TeacherPaymentEntityExtensions on TeacherPaymentDataListEntity {
  TeacherPaymentsDataList get toDomain => TeacherPaymentsDataList(
        dateAndTime: dateAndTime,
        deletedAt: deletedAt,
        id: id,
        notes: notes,
        pay: pay,
        payNo: payNo,
        shouldPaidDate: shouldPaidDate,
        studyYear: studyYear,
      );
}

extension ListTeacherPaymentDataResponseDtoExtensions
    on List<TeacherPaymentDataListResponseDto> {
  List<TeacherPaymentsDataList> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<TeacherPaymentDataListEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListTeacherPaymentDataEntityExtensions
    on List<TeacherPaymentDataListEntity> {
  List<TeacherPaymentsDataList> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
