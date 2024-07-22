class StudentAccountUiState {
  final bool showForm;
  final bool showHeader;

  StudentAccountUiState({
    required this.showForm,
    required this.showHeader,
  });

  StudentAccountUiState.defaultObj()
      : this(
          showForm: false,
          showHeader: true,
        );

  StudentAccountUiState copyWith({
    bool? showForm,
    bool? showHeader,
  }) =>
      StudentAccountUiState(
        showForm: showForm ?? this.showForm,
        showHeader: showHeader ?? this.showHeader,
      );
}
