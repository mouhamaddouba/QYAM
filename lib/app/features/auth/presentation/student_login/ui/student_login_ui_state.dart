import 'package:flutter/material.dart';

class StudentLoginUiState {
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final bool isLoading;
  final bool showForm;
  final bool showHeader;
  final bool showPassword;

  StudentLoginUiState({
    required this.phoneNumberController,
    required this.passwordController,
    required this.isLoading,
    required this.showForm,
    required this.showHeader,
    required this.showPassword,
  });

  StudentLoginUiState.defaultObj()
      : this(
          phoneNumberController: TextEditingController(),
          passwordController: TextEditingController(),
          isLoading: false,
          showForm: false,
          showHeader: true,
          showPassword: false,
        );

  StudentLoginUiState copyWith({
    TextEditingController? phoneNumberController,
    TextEditingController? passwordController,
    bool? isLoading,
    bool? showForm,
    bool? showHeader,
    bool? showPassword,
  }) =>
      StudentLoginUiState(
        phoneNumberController:
            phoneNumberController ?? this.phoneNumberController,
        passwordController: passwordController ?? this.passwordController,
        isLoading: isLoading ?? this.isLoading,
        showForm: showForm ?? this.showForm,
        showHeader: showHeader ?? this.showHeader,
        showPassword: showPassword ?? this.showPassword,
      );
}
