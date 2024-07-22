class TeacherExamsResponseDto {
  final int id;
  final String name;
  final dynamic deletedAt;
  final String type;
  final int subjectId;
  final String subjectName;
  final DateTime dateAndTime;
  final String teacherName;
  final int grade;
  final String adminNote;
  final String teacherNote;
  final int maxMark;

  TeacherExamsResponseDto({
    required this.id,
    required this.name,
    required this.deletedAt,
    required this.type,
    required this.subjectId,
    required this.subjectName,
    required this.dateAndTime,
    required this.teacherName,
    required this.grade,
    required this.adminNote,
    required this.teacherNote,
    required this.maxMark,
  });

  factory TeacherExamsResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      TeacherExamsResponseDto(
        id: json['id'],
        name: json['name'],
        deletedAt: json['deletedAt'],
        type: json['type'],
        subjectId: json['subjectId'],
        subjectName: json['subjectName'],
        dateAndTime: DateTime.parse(json['dateAndTime']),
        teacherName: json['teacherName'] ?? '',
        grade: json['grade'] ?? 0,
        adminNote: json['adminNote'] ?? '',
        teacherNote: json['teacherNote'] ?? '',
        maxMark: json['maxMark'],
      );
}
