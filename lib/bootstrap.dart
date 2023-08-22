import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import 'common/common.dart';

Future<void> bootstrap({
  required Widget Function(RouterConfig<Object> routerConfig) builder,
  bool isDebug = kDebugMode,
}) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      configureDependencies();

      final router = getIt<GoRouter>();

      runApp(
        OrientationBuilder(
          builder: (context, orientation) => ScreenUtilInit(
            designSize: orientation == Orientation.portrait ? const Size(390, 844) : const Size(844, 390),
            builder: (ctx, _) => EasyLocalization(
              path: 'assets/translations',
              assetLoader: JsonAssetLoader(),
              supportedLocales: const [Locale('en')],
              fallbackLocale: const Locale('en'),
              child: builder(router),
            ),
          ),
        ),
      );
    },
    (Object error, StackTrace stackTrace) => getIt<Logger>().e(
      'Uncaught exception',
      error,
      stackTrace,
    ),
  );
}
