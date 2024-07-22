abstract class StudentAccountUiEvent {
  factory StudentAccountUiEvent.delayTimeOutHeader() = DelayTimeOutHeaderEvent;

  factory StudentAccountUiEvent.backtoDashboard() = BacktoDashboardEvent;

  factory StudentAccountUiEvent.logout() = LogoutEvent;

  factory StudentAccountUiEvent.deleteImage() = DeleteImageEvent;
}

class DelayTimeOutHeaderEvent implements StudentAccountUiEvent {
  DelayTimeOutHeaderEvent();
}

class BacktoDashboardEvent implements StudentAccountUiEvent {
  BacktoDashboardEvent();
}

class LogoutEvent implements StudentAccountUiEvent {
  LogoutEvent();
}

class DeleteImageEvent implements StudentAccountUiEvent {
  DeleteImageEvent();
}
