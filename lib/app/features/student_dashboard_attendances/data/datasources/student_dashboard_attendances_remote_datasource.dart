import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/network/api_provider.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/data/models/remote/response/student_attendances_response_dto.dart';

abstract class StudentDashboardAttendancesRemoteDatasource {
  Future<List<StudentAttendancesResponseDto>?> getAttendances({
    required String studyYear,
    required String year,
    required String month,
  });
}

class StudentDashboardAttendancesRemoteDatasourceImpl
    implements StudentDashboardAttendancesRemoteDatasource {
  @override
  Future<List<StudentAttendancesResponseDto>?> getAttendances({
    required String studyYear,
    required String year,
    required String month,
  }) async {
    List<StudentAttendancesResponseDto>? result;

    await ApiProvider.get(
      token: AuthUserUtils.token,
      url: AppUrls.attendances(
        studyYear: studyYear,
        year: year,
        month: month,
      ),
      onSuccess: (dynamic data) {
        final networkResponse =
            NetworkResponse.fromJson<StudentAttendancesResponseDto>(
          data,
          StudentAttendancesResponseDto.fromJson,
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
