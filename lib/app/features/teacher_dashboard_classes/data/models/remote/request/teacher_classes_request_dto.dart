class TeacherClassesRequestDto {
  final bool isStudent;

  TeacherClassesRequestDto({
    required this.isStudent,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isStudent': isStudent,
      };
}
