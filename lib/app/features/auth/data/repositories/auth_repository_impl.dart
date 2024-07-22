import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/error/exceptions.dart';
import 'package:qyam_novers_mobile/app/core/utils/app_network_utils.dart';

import 'package:qyam_novers_mobile/app/features/auth/domain/entities/login_data.dart';
import 'package:qyam_novers_mobile/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:qyam_novers_mobile/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:qyam_novers_mobile/app/features/auth/data/models/remote/request/login_request_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, LoginData>> login({
    required String phoneNumber,
    required String password,
    required bool remeberMe,
    required String email,
    required bool byEmail,
  }) async {
    try {
      if (await AppNetworkUtilsImpl.instance.isConnected) {
        final result = await _remoteDatasource.login(
          data: LoginRequestDto(
            phoneNumber: phoneNumber,
            password: password,
            remeberMe: remeberMe,
            email: email,
            byEmail: byEmail,
          ),
        );

        return Right(
          result!,
        );
      }

      return Left(
        NoInternetConnectionFailure(),
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }
}
