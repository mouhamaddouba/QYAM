import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:qyam_novers_mobile/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:qyam_novers_mobile/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/teacher_login_controller.dart';

class TeacherLoginBinding extends Bindings {
  @override
  void dependencies() {
    final authRepository = AuthRepositoryImpl(
      remoteDatasource: AuthRemoteDatasourceImpl(),
    );

    final loginUseCase = LoginUseCase(
      repository: authRepository,
    );

    Get.lazyPut(
      () => TeacherLoginController(
        loginUseCase: loginUseCase,
      ),
    );
  }
}
