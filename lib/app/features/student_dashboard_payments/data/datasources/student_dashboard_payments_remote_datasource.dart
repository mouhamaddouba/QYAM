import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/network/api_provider.dart';
import 'package:qyam_novers_mobile/app/core/data/remote_data_state.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/data/models/remote/response/student_payments_response_dto.dart';

abstract class StudentDashboardPaymentsRemoteDatasource {
  Future<RemoteDataState<List<StudentPaymentDataListResponseDto>?>>
      getPayments({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  });
}

class StudentDashboardPaymentsRemoteDatasourceImpl
    implements StudentDashboardPaymentsRemoteDatasource {
  @override
  Future<RemoteDataState<List<StudentPaymentDataListResponseDto>?>>
      getPayments({
    required String studyYear,
    required int pageSize,
    required int pageNumber,
    required bool withPaging,
  }) async {
    List<StudentPaymentDataListResponseDto>? dataList;
    PagedList? pagedList;

    await ApiProvider.get(
      token: AuthUserUtils.token,
      url: AppUrls.payments(
        withPaging: withPaging,
        pageNumber: pageNumber,
        pageSize: pageSize,
        studyYear: studyYear,
      ),
      onSuccess: (dynamic data) {
        final networkResponse =
            NetworkResponse.fromJson<StudentPaymentDataListResponseDto>(
          data,
          StudentPaymentDataListResponseDto.fromJson,
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
