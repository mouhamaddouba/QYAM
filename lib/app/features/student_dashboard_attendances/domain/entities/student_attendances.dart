class StudentAttendances {
  final int id;
  final dynamic deletedAt;
  final String value;
  final String note;
  final DateTime dateAndTime;
  final dynamic durationId;
  final int day;
  final String dayOfWeek;

  StudentAttendances({
    required this.id,
    required this.deletedAt,
    required this.value,
    required this.note,
    required this.dateAndTime,
    required this.durationId,
    required this.day,
    required this.dayOfWeek,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'deletedAt': deletedAt,
        'value': value,
        'note': note,
        'dateAndTime': dateAndTime.toIso8601String(),
        'durationId': durationId,
        'day': day,
        'dayOfWeek': dayOfWeek,
      };
}
