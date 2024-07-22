class TeacherAccountUiState {
  final bool showForm;
  final bool showHeader;

  TeacherAccountUiState({
    required this.showForm,
    required this.showHeader,
  });

  TeacherAccountUiState.defaultObj()
      : this(
          showForm: false,
          showHeader: true,
        );

  TeacherAccountUiState copyWith({
    bool? showForm,
    bool? showHeader,
  }) =>
      TeacherAccountUiState(
        showForm: showForm ?? this.showForm,
        showHeader: showHeader ?? this.showHeader,
      );
}
