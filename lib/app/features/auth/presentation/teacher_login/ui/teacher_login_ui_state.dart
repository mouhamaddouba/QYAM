import 'package:flutter/material.dart';

class TeacherLoginUiState {
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final bool isLoading;
  final bool showForm;
  final bool showHeader;
  final bool showPassword;

  TeacherLoginUiState({
    required this.phoneNumberController,
    required this.passwordController,
    required this.isLoading,
    required this.showForm,
    required this.showHeader,
    required this.showPassword,
  });

  TeacherLoginUiState.defaultObj()
      : this(
          phoneNumberController: TextEditingController(),
          passwordController: TextEditingController(),
          isLoading: false,
          showForm: false,
          showHeader: true,
          showPassword: false,
        );

  TeacherLoginUiState copyWith({
    TextEditingController? phoneNumberController,
    TextEditingController? passwordController,
    bool? isLoading,
    bool? showForm,
    bool? showHeader,
    bool? showPassword,
  }) =>
      TeacherLoginUiState(
        phoneNumberController:
            phoneNumberController ?? this.phoneNumberController,
        passwordController: passwordController ?? this.passwordController,
        isLoading: isLoading ?? this.isLoading,
        showForm: showForm ?? this.showForm,
        showHeader: showHeader ?? this.showHeader,
        showPassword: showPassword ?? this.showPassword,
      );
}
