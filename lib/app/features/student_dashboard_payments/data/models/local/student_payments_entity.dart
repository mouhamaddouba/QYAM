class StudentPaymentsEntity {
  final int totalPaid;
  final int totalShouldPaid;
  final int totalRemainPaid;
  final List<StudentPaymentDataListEntity> dataList;

  StudentPaymentsEntity({
    required this.totalPaid,
    required this.totalShouldPaid,
    required this.totalRemainPaid,
    required this.dataList,
  });

  factory StudentPaymentsEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      StudentPaymentsEntity(
        totalPaid: json['totalPaid'],
        totalShouldPaid: json['totalShouldPaid'],
        totalRemainPaid: json['totalRemainPaid'],
        dataList: List<StudentPaymentDataListEntity>.from(
          json['dataList'].map(
            (vlaue) => StudentPaymentDataListEntity.fromJson(vlaue),
          ),
        ),
      );
}

class StudentPaymentDataListEntity {
  final int id;
  final int payNo;
  final int pay;
  final DateTime dateAndTime;
  final String notes;
  final String studyYear;
  final String shouldPaidDate;
  final dynamic deletedAt;

  StudentPaymentDataListEntity({
    required this.id,
    required this.payNo,
    required this.pay,
    required this.dateAndTime,
    required this.notes,
    required this.studyYear,
    required this.shouldPaidDate,
    required this.deletedAt,
  });

  factory StudentPaymentDataListEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      StudentPaymentDataListEntity(
        id: json['id'],
        payNo: json['payNo'],
        pay: json['pay'],
        dateAndTime: DateTime.parse(json['dateAndTime']),
        notes: json['notes'],
        studyYear: json['studyYear'],
        shouldPaidDate: json['shouldPaidDate'],
        deletedAt: json['deletedAt'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'payNo': payNo,
        'pay': pay,
        'dateAndTime': dateAndTime.toIso8601String(),
        'notes': notes,
        'studyYear': studyYear,
        'shouldPaidDate': shouldPaidDate,
        'deletedAt': deletedAt,
      };
}
