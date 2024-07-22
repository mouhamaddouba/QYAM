import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';

import 'package:qyam_novers_mobile/app/features/notifications/data/models/local/notifications_entity.dart';

abstract class NotificationsLocaleDatasource {
  Future<void> storeNotifications({
    required List<NotificationsEntity> dataList,
  });

  Future<List<NotificationsEntity>> getNotifications();
}

class NotificationsLocalDatasourceImpl
    implements NotificationsLocaleDatasource {
  static const String _dataListKey = 'NotificationsDataList';

  @override
  Future<List<NotificationsEntity>> getNotifications() async {
    final List<NotificationsEntity> dataList;

    try {
      dataList = AppStorage.read<List<dynamic>>(
        _dataListKey,
        [],
      )
          .map(
            (element) => NotificationsEntity.fromJson(
              element,
            ),
          )
          .toList();

      return dataList;
    } on Exception catch (exception) {
      throw LocalException(
        message: exception.toString(),
      );
    }
  }

  @override
  Future<void> storeNotifications({
    required List<NotificationsEntity> dataList,
  }) async {
    try {
      await AppStorage.write(
        _dataListKey,
        dataList,
      );
    } on Exception catch (exception) {
      throw LocalException(
        message: exception.toString(),
      );
    }
  }
}
