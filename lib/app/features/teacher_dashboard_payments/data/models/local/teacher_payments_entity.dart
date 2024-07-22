class TeacherPaymentsEntity {
  final int totalPaid;
  final int totalShouldPaid;
  final int totalRemainPaid;
  final List<TeacherPaymentDataListEntity> dataList;

  TeacherPaymentsEntity({
    required this.totalPaid,
    required this.totalShouldPaid,
    required this.totalRemainPaid,
    required this.dataList,
  });

  factory TeacherPaymentsEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      TeacherPaymentsEntity(
        totalPaid: json['totalPaid'],
        totalShouldPaid: json['totalShouldPaid'],
        totalRemainPaid: json['totalRemainPaid'],
        dataList: List<TeacherPaymentDataListEntity>.from(
          json['dataList'].map(
            (vlaue) => TeacherPaymentDataListEntity.fromJson(vlaue),
          ),
        ),
      );
}

class TeacherPaymentDataListEntity {
  final int id;
  final int payNo;
  final int pay;
  final DateTime dateAndTime;
  final String notes;
  final String studyYear;
  final String shouldPaidDate;
  final dynamic deletedAt;

  TeacherPaymentDataListEntity({
    required this.id,
    required this.payNo,
    required this.pay,
    required this.dateAndTime,
    required this.notes,
    required this.studyYear,
    required this.shouldPaidDate,
    required this.deletedAt,
  });

  factory TeacherPaymentDataListEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      TeacherPaymentDataListEntity(
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
