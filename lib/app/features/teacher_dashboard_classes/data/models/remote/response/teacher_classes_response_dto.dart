class TeacherClassesResponseDto {
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

  TeacherClassesResponseDto({
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

  factory TeacherClassesResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      TeacherClassesResponseDto(
        id: json['id'],
        durationId: json['durationId'],
        studyYear: json['studyYear'],
        day: json['day'],
        dayLabel: json['dayLabel'],
        groupId: json['groupId'],
        subjectId: json['subjectId'],
        subjectName: json['subjectName'],
        groupFullName: json['groupFullName'],
        teacherId: json['teacherId'],
        deletedAt: json['deletedAt'],
        duration: json['duration'],
        teacherName: json['teacherName'],
        groupName: json['groupName'],
        studyLevelName: json['studyLevelName'],
        groupGender: json['groupGender'],
      );
}
