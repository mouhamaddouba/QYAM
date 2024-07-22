abstract class StudentLoginUiEvent {
  factory StudentLoginUiEvent.delayTimeOutHeader() = DelayTimeOutHeaderEvent;

  factory StudentLoginUiEvent.backtoLoginMain() = BacktoLoginMainEvent;

  factory StudentLoginUiEvent.prefixPassword({
    required bool showPassword,
  }) = PrefixPasswordEvent;

  factory StudentLoginUiEvent.studentLogin({
    required String phoneNumber,
    required String password,
    required String email,
    required bool byEmail,
    required bool remeberMe,
  }) = StudentLoginEvent;
}

class DelayTimeOutHeaderEvent implements StudentLoginUiEvent {
  DelayTimeOutHeaderEvent();
}

class BacktoLoginMainEvent implements StudentLoginUiEvent {
  BacktoLoginMainEvent();
}

class PrefixPasswordEvent implements StudentLoginUiEvent {
  final bool showPassword;

  PrefixPasswordEvent({
    required this.showPassword,
  });
}

class StudentLoginEvent implements StudentLoginUiEvent {
  final String phoneNumber;
  final String password;
  final String email;
  final bool byEmail;
  final bool remeberMe;

  StudentLoginEvent({
    required this.phoneNumber,
    required this.password,
    required this.email,
    required this.byEmail,
    required this.remeberMe,
  });
}
