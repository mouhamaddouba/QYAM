class TeacherExams {
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

  TeacherExams({
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'deletedAt': deletedAt,
        'type': type,
        'subjectId': subjectId,
        'subjectName': subjectName,
        'dateAndTime': dateAndTime.toIso8601String(),
        'teacherName': teacherName,
        'grade': grade,
        'adminNote': adminNote,
        'teacherNote': teacherNote,
        'maxMark': maxMark,
      };
}
