import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/models/local/student_payments_entity.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/models/remote/response/student_payments_response_dto.dart';

extension StudentPaymentResponseDtoExtensions
    on StudentPaymentDataListResponseDto {
  StudentPaymentsDataList get toDomain => StudentPaymentsDataList(
        dateAndTime: dateAndTime,
        deletedAt: deletedAt,
        id: id,
        notes: notes,
        pay: pay,
        payNo: payNo,
        shouldPaidDate: shouldPaidDate,
        studyYear: studyYear,
      );

  StudentPaymentDataListEntity get toEntity => StudentPaymentDataListEntity(
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

extension StudentPaymentEntityExtensions on StudentPaymentDataListEntity {
  StudentPaymentsDataList get toDomain => StudentPaymentsDataList(
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

extension ListStudentPaymentResponseDtoExtensions
    on List<StudentPaymentDataListResponseDto> {
  List<StudentPaymentsDataList> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<StudentPaymentDataListEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListStudentPaymentDataListEntityExtensions
    on List<StudentPaymentDataListEntity> {
  List<StudentPaymentsDataList> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
