class StudentClassesRequestDto {
  final bool isStudent;

  StudentClassesRequestDto({
    required this.isStudent,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isStudent': isStudent,
      };
}
