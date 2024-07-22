import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';

abstract class NotificationsUiEvent {
  factory NotificationsUiEvent.getNotification({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) = GetNotificationEvent;

  factory NotificationsUiEvent.toNotificationsDetails({
    //required int notificationId,
    required NotificationsData notificationsData,
  }) = ToNotificationsDetailsEvent;

  factory NotificationsUiEvent.backtoClassesPage() = BacktoClassesPageEvent;

  factory NotificationsUiEvent.logout() = LogoutEvent;

  factory NotificationsUiEvent.refresh() = RefreshEvent;
}

class GetNotificationEvent implements NotificationsUiEvent {
  final String studyYear;
  final int pageSize;
  final int pageNumber;
  final bool withPaging;

  GetNotificationEvent({
    required this.studyYear,
    required this.pageSize,
    required this.pageNumber,
    required this.withPaging,
  });
}

class BacktoClassesPageEvent implements NotificationsUiEvent {
  BacktoClassesPageEvent();
}

class LogoutEvent implements NotificationsUiEvent {
  LogoutEvent();
}

class ToNotificationsDetailsEvent implements NotificationsUiEvent {
  // final int notificationId;
  final NotificationsData notificationsData;

  ToNotificationsDetailsEvent({
    //required this.notificationId,
    required this.notificationsData,
  });
}

class RefreshEvent implements NotificationsUiEvent {
  RefreshEvent();
}
