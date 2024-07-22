import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/notifications/domain/use_cases/notifications_use_case.dart';
import 'package:qyam_novers_mobile/app/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/notifications/data/datasources/notifications_local_datasource.dart';
import 'package:qyam_novers_mobile/app/features/notifications/data/datasources/notifications_remote_datasource.dart';
import 'package:qyam_novers_mobile/app/features/notifications/presentation/notifications/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    // Attendances
    final notificationRepository = NotificationsRepositoryImpl(
      remoteDatasource: NotificationsRemoteDatasourceImpl(),
      localDatasource: NotificationsLocalDatasourceImpl(),
    );

    final getNotificationsUseCase = NotificationsUseCase(
      repository: notificationRepository,
    );

    Get.lazyPut(
      () => NotificationsController(
        getNotificationsUseCase: getNotificationsUseCase,
      ),
    );
  }
}
