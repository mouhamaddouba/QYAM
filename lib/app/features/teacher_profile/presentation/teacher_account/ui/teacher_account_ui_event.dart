abstract class TeacherAccountUiEvent {
  factory TeacherAccountUiEvent.delayTimeOutHeader() = DelayTimeOutHeaderEvent;

  factory TeacherAccountUiEvent.backtoDashboard() = BacktoDashboardEvent;

  factory TeacherAccountUiEvent.logout() = LogoutEvent;

  factory TeacherAccountUiEvent.deleteImage() = DeleteImageEvent;
}

class DelayTimeOutHeaderEvent implements TeacherAccountUiEvent {
  DelayTimeOutHeaderEvent();
}

class BacktoDashboardEvent implements TeacherAccountUiEvent {
  BacktoDashboardEvent();
}

class LogoutEvent implements TeacherAccountUiEvent {
  LogoutEvent();
}

class DeleteImageEvent implements TeacherAccountUiEvent {
  DeleteImageEvent();
}
