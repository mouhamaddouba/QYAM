import 'package:qyam_novers_mobile/app/core/error/export_error.dart';
import 'package:qyam_novers_mobile/app/core/network/api_provider.dart';
import 'package:qyam_novers_mobile/app/core/data/remote_data_state.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/notifications/data/models/remote/response/notifications_response_dto.dart';

abstract class NotificationsRemoteDatasource {
  Future<RemoteDataState<List<NotificationsResponseDto>?>> getNotification({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  });
}

class NotificationsRemoteDatasourceImpl
    implements NotificationsRemoteDatasource {
  @override
  Future<RemoteDataState<List<NotificationsResponseDto>?>> getNotification({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) async {
    List<NotificationsResponseDto>? dataList;
    PagedList? pagedList;

    await ApiProvider.get(
      token: AuthUserUtils.token,
      url: AppUrls.notification(
        studyYear: studyYear,
        pageSize: pageSize,
        pageNumber: pageNumber,
        withPaging: withPaging,
      ),
      onSuccess: (dynamic data) {
        final networkResponse =
            NetworkResponse.fromJson<NotificationsResponseDto>(
          data,
          NotificationsResponseDto.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        dataList = networkResponse.dataList ?? [];
        pagedList = networkResponse.pagedList;
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return RemoteDataState.done(
      data: dataList,
      pagedList: pagedList,
    );
  }
}
