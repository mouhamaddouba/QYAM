abstract class StudentProfileUiEvent {
  factory StudentProfileUiEvent.backtoDashboard() = BacktoDashboardEvent;

  factory StudentProfileUiEvent.toNotification() = ToNotificationEvent;

  factory StudentProfileUiEvent.toAccount() = ToAccountEvent;

  factory StudentProfileUiEvent.logout() = LogoutEvent;

  factory StudentProfileUiEvent.changeToArabic() = ChangeToArabicEvent;

  factory StudentProfileUiEvent.changeToEnglish() = ChangeToEnglishEvent;

  factory StudentProfileUiEvent.changeToLightTheme() = ChangeToLightThemeEvent;

  factory StudentProfileUiEvent.changeToDarkTheme() = ChangeToDarkThemeEvent;
}

class BacktoDashboardEvent implements StudentProfileUiEvent {
  BacktoDashboardEvent();
}

class ToNotificationEvent implements StudentProfileUiEvent {
  ToNotificationEvent();
}

class ToAccountEvent implements StudentProfileUiEvent {
  ToAccountEvent();
}

class LogoutEvent implements StudentProfileUiEvent {
  LogoutEvent();
}

class ChangeToArabicEvent implements StudentProfileUiEvent {
  ChangeToArabicEvent();
}

class ChangeToEnglishEvent implements StudentProfileUiEvent {
  ChangeToEnglishEvent();
}

class ChangeToLightThemeEvent implements StudentProfileUiEvent {
  ChangeToLightThemeEvent();
}

class ChangeToDarkThemeEvent implements StudentProfileUiEvent {
  ChangeToDarkThemeEvent();
}
