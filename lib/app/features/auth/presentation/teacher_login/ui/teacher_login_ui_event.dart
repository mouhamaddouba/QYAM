abstract class TeacherLoginUiEvent {
  factory TeacherLoginUiEvent.delayTimeOutHeader() = DelayTimeOutHeaderEvent;

  factory TeacherLoginUiEvent.backtoLoginMain() = BacktoLoginMainEvent;

  factory TeacherLoginUiEvent.prefixPassword({
    required bool showPassword,
  }) = PrefixPasswordEvent;

  factory TeacherLoginUiEvent.teacherLogin({
    required String phoneNumber,
    required String password,
    required String email,
    required bool byEmail,
    required bool remeberMe,
  }) = TeacherLoginEvent;
}

class DelayTimeOutHeaderEvent implements TeacherLoginUiEvent {
  DelayTimeOutHeaderEvent();
}

class BacktoLoginMainEvent implements TeacherLoginUiEvent {
  BacktoLoginMainEvent();
}

class PrefixPasswordEvent implements TeacherLoginUiEvent {
  final bool showPassword;

  PrefixPasswordEvent({
    required this.showPassword,
  });
}

class TeacherLoginEvent implements TeacherLoginUiEvent {
  final String phoneNumber;
  final String password;
  final String email;
  final bool byEmail;
  final bool remeberMe;

  TeacherLoginEvent({
    required this.phoneNumber,
    required this.password,
    required this.email,
    required this.byEmail,
    required this.remeberMe,
  });
}
