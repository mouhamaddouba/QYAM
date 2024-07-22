import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/network/api_provider.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/data/models/remote/response/teacher_lates_response_dto.dart';

abstract class TeacherDashboardLatesRemoteDatasource {
  Future<List<TeacherLatesResponseDto>?> getLates({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String toDate,
    required String fromDate,
  });
}

class TeacherDashboardLatesRemoteDatasourceImpl
    implements TeacherDashboardLatesRemoteDatasource {
  @override
  Future<List<TeacherLatesResponseDto>?> getLates({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String toDate,
    required String fromDate,
  }) async {
    List<TeacherLatesResponseDto>? result;

    await ApiProvider.get(
      url: AppUrls.lates(
        studyYear: studyYear,
        fromDate: fromDate,
        pageNumber: pageNumber,
        toDate: toDate,
        pageSize: pageSize,
        withPaging: withPaging,
      ),
      token: AuthUserUtils.token,
      onSuccess: (dynamic data) {
        final networkResponse =
            NetworkResponse.fromJson<TeacherLatesResponseDto>(
          data,
          TeacherLatesResponseDto.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        result = networkResponse.dataList ?? [];
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return result;
  }
}
