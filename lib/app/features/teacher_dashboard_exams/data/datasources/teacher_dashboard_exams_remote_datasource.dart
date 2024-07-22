import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/network/api_provider.dart';
import 'package:qyam_novers_mobile/app/core/data/remote_data_state.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_exams/data/models/remote/response/teacher_exams_response_dto.dart';

abstract class TeacherDashboardExamsRemoteDatasource {
  Future<RemoteDataState<List<TeacherExamsResponseDto>?>> getExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  });
}

class TeacherDashboardExamsRemoteDatasourceImpl
    implements TeacherDashboardExamsRemoteDatasource {
  @override
  Future<RemoteDataState<List<TeacherExamsResponseDto>?>> getExams({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
    required String status,
  }) async {
    List<TeacherExamsResponseDto>? dataList;
    PagedList? pagedList;

    await ApiProvider.get(
      token: AuthUserUtils.token,
      url: AppUrls.teacherExams(
        studyYear: studyYear,
        pageSize: pageSize,
        pageNumber: pageNumber,
        withPaging: withPaging,
        status: status,
      ),
      onSuccess: (dynamic data) {
        final networkResponse =
            NetworkResponse.fromJson<TeacherExamsResponseDto>(
          data,
          TeacherExamsResponseDto.fromJson,
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
