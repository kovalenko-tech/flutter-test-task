import 'package:apptest/common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application(
    this.routerConfig, {
    super.key,
  });

  final RouterConfig<Object> routerConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: context.themeData,
      routerConfig: routerConfig,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? Container(),
        );
      },
    );
  }
}
