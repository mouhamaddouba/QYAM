class StudentExamsResponseDto {
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

  StudentExamsResponseDto({
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

  factory StudentExamsResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      StudentExamsResponseDto(
        id: json['id'],
        name: json['name'],
        deletedAt: json['deletedAt'],
        type: json['type'],
        subjectId: json['subjectId'],
        subjectName: json['subjectName'],
        dateAndTime: DateTime.parse(json['dateAndTime']),
        teacherName: json['teacherName'],
        grade: json['grade'],
        adminNote: json['adminNote'],
        teacherNote: json['teacherNote'],
        maxMark: json['maxMark'],
      );
}
