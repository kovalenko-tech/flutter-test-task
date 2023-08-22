import 'package:apptest/common/router/router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class ThirdPartyModule {
  GoRouter get router => GoRouter(routes: $appRoutes);

  @singleton
  Logger get logger => Logger();

  @singleton
  FlutterSecureStorage get flutterSecureStorage => FlutterSecureStorage();
}
