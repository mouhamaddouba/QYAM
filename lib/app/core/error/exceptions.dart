import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

import 'package:get/get.dart';

class ServerException implements Exception {
  final dynamic message;

  ServerException({
    this.message,
  });

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return AppStrings.serverException.tr;
    return message.toString();
  }
}

class LocalException implements Exception {
  final dynamic message;

  LocalException({
    this.message,
  });

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return AppStrings.localException.tr;
    return message.toString();
  }
}
