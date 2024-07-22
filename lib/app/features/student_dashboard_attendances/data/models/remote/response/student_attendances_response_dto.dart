class StudentAttendancesResponseDto {
  final int id;
  final dynamic deletedAt;
  final String value;
  final String note;
  final DateTime dateAndTime;
  final dynamic durationId;
  final int day;
  final String dayOfWeek;

  StudentAttendancesResponseDto({
    required this.id,
    required this.deletedAt,
    required this.value,
    required this.note,
    required this.dateAndTime,
    required this.durationId,
    required this.day,
    required this.dayOfWeek,
  });

  factory StudentAttendancesResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      StudentAttendancesResponseDto(
        id: json['id'],
        deletedAt: json['deletedAt'],
        value: json['value'],
        note: json['note'],
        dateAndTime: DateTime.parse(json['dateAndTime']),
        durationId: json['durationId'],
        day: json['day'],
        dayOfWeek: json['dayOfWeek'],
      );
}
