import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

import 'package:get/get.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final List<Object?> properties;

  const Failure({
    this.message = AppStrings.failure,
    this.properties = const [],
  });

  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure {
  ServerFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.serverFailure.tr,
        );
}

class LocalFailure extends Failure {
  LocalFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.localFailure.tr,
        );
}

class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.noInternetConnection.tr,
        );
}
