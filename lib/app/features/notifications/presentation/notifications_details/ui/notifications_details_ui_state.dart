import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';

class NotificationsDetailsUiState {
  final NotificationsData? notificationsData;

  NotificationsDetailsUiState({
    this.notificationsData,
  });

  NotificationsDetailsUiState.defaultObj() : this();

  NotificationsDetailsUiState copyWith({
    NotificationsData? notificationsData,
  }) =>
      NotificationsDetailsUiState(
        notificationsData: notificationsData ?? this.notificationsData,
      );
}
