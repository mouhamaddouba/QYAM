import 'package:dartz/dartz.dart';

import 'package:qyam_novers_mobile/app/core/error/failures.dart';
import 'package:qyam_novers_mobile/app/core/use_case/use_case.dart';

import 'package:qyam_novers_mobile/app/features/auth/domain/entities/login_data.dart';
import 'package:qyam_novers_mobile/app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<LoginData, Params> {
  final AuthRepository _repository;

  LoginUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, LoginData>> call(Params params) {
    return _repository.login(
      phoneNumber: params.phoneNumber,
      password: params.password,
      byEmail: params.byEmail,
      email: params.email,
      remeberMe: params.remeberMe,
    );
  }
}

class Params {
  final String phoneNumber;
  final String password;
  final String email;
  final bool byEmail;
  final bool remeberMe;

  Params({
    required this.phoneNumber,
    required this.password,
    required this.email,
    required this.byEmail,
    required this.remeberMe,
  });
}
