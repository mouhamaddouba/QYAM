import 'package:qyam_novers_mobile/app/features/notifications/domain/entities/notifications_data.dart';
import 'package:qyam_novers_mobile/app/features/notifications/data/models/local/notifications_entity.dart';
import 'package:qyam_novers_mobile/app/features/notifications/data/models/remote/response/notifications_response_dto.dart';

extension NotificationExtensions on NotificationsResponseDto {
  NotificationsData get toDomain => NotificationsData(
        id: id,
        title: title,
        image: image,
        content: content,
        topic: topic,
        addDate: addDate,
        senderName: senderName,
        senderEmail: senderEmail,
        isSpecificParent: isSpecificParent,
      );

  NotificationsEntity get toEntity => NotificationsEntity(
        id: id,
        title: title,
        image: image,
        content: content,
        topic: topic,
        addDate: addDate,
        senderName: senderName,
        senderEmail: senderEmail,
        isSpecificParent: isSpecificParent,
      );
}

extension NotificationsEntityExtensions on NotificationsEntity {
  NotificationsData get toDomain => NotificationsData(
        id: id,
        title: title,
        image: image,
        content: content,
        topic: topic,
        addDate: addDate,
        senderName: senderName,
        senderEmail: senderEmail,
        isSpecificParent: isSpecificParent,
      );
}

extension ListNotificationsResponseDtoExtensions
    on List<NotificationsResponseDto> {
  List<NotificationsData> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();

  List<NotificationsEntity> get toEntityList => map(
        (element) => element.toEntity,
      ).toList();
}

extension ListNotificationsEntityExtensions on List<NotificationsEntity> {
  List<NotificationsData> get toDomainList => map(
        (element) => element.toDomain,
      ).toList();
}
