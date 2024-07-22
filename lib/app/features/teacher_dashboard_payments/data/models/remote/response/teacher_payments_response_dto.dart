// ignore_for_file: prefer_void_to_null

class TeacherPaymentsResponseDto {
  final int totalPaid;
  final int totalShouldPaid;
  final int totalRemainPaid;
  final List<TeacherPaymentDataListResponseDto> dataList;

  TeacherPaymentsResponseDto({
    required this.totalPaid,
    required this.totalShouldPaid,
    required this.totalRemainPaid,
    required this.dataList,
  });

  factory TeacherPaymentsResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      TeacherPaymentsResponseDto(
        totalPaid: json['totalPaid'],
        totalShouldPaid: json['totalShouldPaid'],
        totalRemainPaid: json['totalRemainPaid'],
        dataList: List<TeacherPaymentDataListResponseDto>.from(
          json['dataList'].map(
            (vlaue) => TeacherPaymentDataListResponseDto.fromJson(vlaue),
          ),
        ),
      );
}

class TeacherPaymentDataListResponseDto {
  final int id;
  final int payNo;
  final int pay;
  final DateTime dateAndTime;
  final String notes;
  final String studyYear;
  final String shouldPaidDate;
  final Null deletedAt;

  TeacherPaymentDataListResponseDto({
    required this.id,
    required this.payNo,
    required this.pay,
    required this.dateAndTime,
    required this.notes,
    required this.studyYear,
    required this.shouldPaidDate,
    required this.deletedAt,
  });

  factory TeacherPaymentDataListResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      TeacherPaymentDataListResponseDto(
        id: json['id'] ?? 0,
        payNo: json['payNo'] ?? 0,
        pay: json['pay'] ?? 0,
        dateAndTime:
            DateTime.parse(json['dateAndTime'] ?? DateTime.now().toString()),
        notes: json['notes'] ?? '',
        studyYear: json['studyYear'] ?? '',
        shouldPaidDate: json['shouldPaidDate'] ?? '',
        deletedAt: json['deletedAt'],
      );
}
