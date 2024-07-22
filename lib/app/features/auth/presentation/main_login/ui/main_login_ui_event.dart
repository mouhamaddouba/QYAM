abstract class MainLoginUiEvent {
  factory MainLoginUiEvent.toStudentLogin() = ToStudentLoginEvent;

  factory MainLoginUiEvent.toTeacherLogin() = ToTeacherLoginEvent;
}

class ToStudentLoginEvent implements MainLoginUiEvent {
  ToStudentLoginEvent();
}

class ToTeacherLoginEvent implements MainLoginUiEvent {
  ToTeacherLoginEvent();
}
