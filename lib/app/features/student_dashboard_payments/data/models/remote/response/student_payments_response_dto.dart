class StudentPaymentsResponseDto {
  final int totalPaid;
  final int totalShouldPaid;
  final int totalRemainPaid;
  final List<StudentPaymentDataListResponseDto> dataList;

  StudentPaymentsResponseDto({
    required this.totalPaid,
    required this.totalShouldPaid,
    required this.totalRemainPaid,
    required this.dataList,
  });

  factory StudentPaymentsResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      StudentPaymentsResponseDto(
        totalPaid: json['totalPaid'],
        totalShouldPaid: json['totalShouldPaid'],
        totalRemainPaid: json['totalRemainPaid'],
        dataList: List<StudentPaymentDataListResponseDto>.from(
          json['dataList'].map(
            (vlaue) => StudentPaymentDataListResponseDto.fromJson(vlaue),
          ),
        ),
      );
}

class StudentPaymentDataListResponseDto {
  final int id;
  final int payNo;
  final int pay;
  final DateTime dateAndTime;
  final String notes;
  final String studyYear;
  final String shouldPaidDate;
  final Null deletedAt;

  StudentPaymentDataListResponseDto({
    required this.id,
    required this.payNo,
    required this.pay,
    required this.dateAndTime,
    required this.notes,
    required this.studyYear,
    required this.shouldPaidDate,
    required this.deletedAt,
  });

  factory StudentPaymentDataListResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      StudentPaymentDataListResponseDto(
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
