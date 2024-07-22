class StudentClassesEntity {
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

  StudentClassesEntity({
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

  factory StudentClassesEntity.fromJson(
    Map<String, dynamic> encodedData,
  ) =>
      StudentClassesEntity(
        id: encodedData['id'],
        durationId: encodedData['durationId'],
        studyYear: encodedData['studyYear'],
        day: encodedData['day'],
        dayLabel: encodedData['dayLabel'],
        groupId: encodedData['groupId'],
        subjectId: encodedData['subjectId'],
        subjectName: encodedData['subjectName'],
        teacherId: encodedData['teacherId'],
        groupFullName: encodedData['groupFullName'],
        deletedAt: encodedData['deletedAt'],
        duration: encodedData['duration'],
        teacherName: encodedData['teacherName'],
        groupName: encodedData['groupName'],
        studyLevelName: encodedData['studyLevelName'],
        groupGender: encodedData['groupGender'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'durationId': durationId,
        'studyYear': studyYear,
        'day': day,
        'dayLabel': dayLabel,
        'groupId': groupId,
        'subjectId': subjectId,
        'groupFullName': groupFullName,
        'subjectName': subjectName,
        'teacherId': teacherId,
        'deletedAt': deletedAt,
        'duration': duration,
        'teacherName': teacherName,
        'groupName': groupName,
        'studyLevelName': studyLevelName,
        'groupGender': groupGender,
      };

  @override
  String toString() {
    return day;
  }
}
