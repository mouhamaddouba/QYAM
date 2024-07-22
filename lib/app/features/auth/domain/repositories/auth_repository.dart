import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';

import 'package:qyam_novers_mobile/app/features/auth/domain/entities/login_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginData>> login({
    required String phoneNumber,
    required String password,
    required bool remeberMe,
    required String email,
    required bool byEmail,
  });
}
