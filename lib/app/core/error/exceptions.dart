import 'package:get/get.dart';
import 'package:qyam/app/core/values/app_strings.dart';

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
