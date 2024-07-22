class TeacherClasses {
  final int id;
  final int durationId;
  final String studyYear;
  final String day;
  final String dayLabel;
  final int groupId;
  final int subjectId;
  final String subjectName;
  final String groupFullName;
  final String teacherId;
  final dynamic deletedAt;
  final String duration;
  final String teacherName;
  final String groupName;
  final String studyLevelName;
  final String groupGender;

  TeacherClasses({
    required this.id,
    required this.durationId,
    required this.studyYear,
    required this.day,
    required this.dayLabel,
    required this.groupId,
    required this.subjectId,
    required this.subjectName,
    required this.groupFullName,
    required this.teacherId,
    required this.deletedAt,
    required this.duration,
    required this.teacherName,
    required this.groupName,
    required this.studyLevelName,
    required this.groupGender,
  });

  @override
  String toString() {
    return day;
  }
}
