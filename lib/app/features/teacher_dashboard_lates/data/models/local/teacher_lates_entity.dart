class TeacherLatesEntity {
  final int id;
  final int minutes;
  final DateTime dateAndTime;
  final String teacherId;
  final int day;
  final dynamic deletedAt;

  TeacherLatesEntity({
    required this.id,
    required this.minutes,
    required this.dateAndTime,
    required this.teacherId,
    required this.day,
    required this.deletedAt,
  });

  factory TeacherLatesEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      TeacherLatesEntity(
        id: json['id'],
        minutes: json['minutes'],
        dateAndTime: DateTime.parse(json['dateAndTime']),
        teacherId: json['teacherId'],
        day: json['day'],
        deletedAt: json['deletedAt'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'minutes': minutes,
        'dateAndTime': dateAndTime.toIso8601String(),
        'teacherId': teacherId,
        'day': day,
        'deletedAt': deletedAt,
      };
}
