abstract class SplashUiEvent {
  factory SplashUiEvent.delayTimeout() = DelayTimeoutEvent;
}

class DelayTimeoutEvent implements SplashUiEvent {
  DelayTimeoutEvent();
}
