class TeacherPayments {
  final int totalPaid;
  final int totalShouldPaid;
  final int totalRemainPaid;
  final List<TeacherPaymentsDataList> dataList;

  TeacherPayments({
    required this.totalPaid,
    required this.totalShouldPaid,
    required this.totalRemainPaid,
    required this.dataList,
  });
}

class TeacherPaymentsDataList {
  final int id;
  final int payNo;
  final int pay;
  final DateTime dateAndTime;
  final String notes;
  final String studyYear;
  final String shouldPaidDate;
  final dynamic deletedAt;

  TeacherPaymentsDataList({
    required this.id,
    required this.payNo,
    required this.pay,
    required this.dateAndTime,
    required this.notes,
    required this.studyYear,
    required this.shouldPaidDate,
    required this.deletedAt,
  });

  Map<String, dynamic> toJson() => {
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
