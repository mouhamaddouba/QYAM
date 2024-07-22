abstract class TeacherProfileUiEvent {
  factory TeacherProfileUiEvent.backtoDashboard() = BacktoDashboardEvent;

  factory TeacherProfileUiEvent.toNotification() = ToNotificationEvent;

  factory TeacherProfileUiEvent.toAccount() = ToAccountEvent;

  factory TeacherProfileUiEvent.logout() = LogoutEvent;

  factory TeacherProfileUiEvent.changeToArabic() = ChangeToArabicEvent;

  factory TeacherProfileUiEvent.changeToEnglish() = ChangeToEnglishEvent;

  factory TeacherProfileUiEvent.changeToLightTheme() = ChangeToLightThemeEvent;

  factory TeacherProfileUiEvent.changeToDarkTheme() = ChangeToDarkThemeEvent;
}

class BacktoDashboardEvent implements TeacherProfileUiEvent {
  BacktoDashboardEvent();
}

class ToNotificationEvent implements TeacherProfileUiEvent {
  ToNotificationEvent();
}

class ToAccountEvent implements TeacherProfileUiEvent {
  ToAccountEvent();
}

class LogoutEvent implements TeacherProfileUiEvent {
  LogoutEvent();
}

class ChangeToArabicEvent implements TeacherProfileUiEvent {
  ChangeToArabicEvent();
}

class ChangeToEnglishEvent implements TeacherProfileUiEvent {
  ChangeToEnglishEvent();
}

class ChangeToLightThemeEvent implements TeacherProfileUiEvent {
  ChangeToLightThemeEvent();
}

class ChangeToDarkThemeEvent implements TeacherProfileUiEvent {
  ChangeToDarkThemeEvent();
}
