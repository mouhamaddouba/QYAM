import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/network/api_provider.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_urls.dart';
import 'package:qyam_novers_mobile/app/core/network_response/network_response.dart';

import 'package:qyam_novers_mobile/app/features/auth/data/models/remote/request/login_request_dto.dart';
import 'package:qyam_novers_mobile/app/features/auth/data/models/remote/response/login_response_dto.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseDto?> login({
    required LoginRequestDto data,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<LoginResponseDto?> login({
    required LoginRequestDto data,
  }) async {
    LoginResponseDto? result;

    await ApiProvider.post(
      token: '',
      url: AppUrls.login(),
      data: data.toJson(),
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson<LoginResponseDto>(
          data,
          LoginResponseDto.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        result = networkResponse.data;
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
