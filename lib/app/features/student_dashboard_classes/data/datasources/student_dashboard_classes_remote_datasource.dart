import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/network/api_provider.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/data/models/remote/response/student_classes_response_dto.dart';

abstract class StudentDashboardClassesRemoteDatasource {
  Future<List<StudentClassesResponseDto>?> getClasses({
    required String studyYear,
    required bool isStudent,
  });
}

class StudentDashboardClassesRemoteDatasourceImpl
    implements StudentDashboardClassesRemoteDatasource {
  @override
  Future<List<StudentClassesResponseDto>?> getClasses({
    required String studyYear,
    required bool isStudent,
  }) async {
    List<StudentClassesResponseDto>? result;

    await ApiProvider.get(
      url: AppUrls.classes(
        isStudent: isStudent,
        studyYear: studyYear,
      ),
      token: AuthUserUtils.token,
      onSuccess: (dynamic data) {
        final networkResponse =
            NetworkResponse.fromJson<StudentClassesResponseDto>(
          data,
          StudentClassesResponseDto.fromJson,
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
