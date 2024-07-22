class TeacherLates {
  final int id;
  final int minutes;
  final DateTime dateAndTime;
  final String teacherId;
  final int day;
  final dynamic deletedAt;

  TeacherLates({
    required this.id,
    required this.minutes,
    required this.dateAndTime,
    required this.teacherId,
    required this.day,
    required this.deletedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'minutes': minutes,
        'dateAndTime': dateAndTime.toIso8601String(),
        'teacherId': teacherId,
        'day': day,
        'deletedAt': deletedAt,
      };
}
