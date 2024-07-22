class TeacherLatesResponseDto {
  final int id;
  final int minutes;
  final DateTime dateAndTime;
  final String teacherId;
  final int day;
  final dynamic deletedAt;

  TeacherLatesResponseDto({
    required this.id,
    required this.minutes,
    required this.dateAndTime,
    required this.teacherId,
    required this.day,
    required this.deletedAt,
  });

  factory TeacherLatesResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      TeacherLatesResponseDto(
        id: json['id'],
        minutes: json['minutes'],
        dateAndTime:
            DateTime.parse(json['dateAndTime'] ?? DateTime.now().toString()),
        teacherId: json['teacherId'],
        day: json['day'],
        deletedAt: json['deletedAt'],
      );
}
