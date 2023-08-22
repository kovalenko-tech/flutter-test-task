import 'package:apptest/common/theme/theme.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  AppTextTheme get textTheme => AppTheme.of(this).textTheme;

  AppThemeColorScheme get colors => AppTheme.of(this).colors;

  ThemeData get themeData => AppTheme.of(this).themeData;

  AppGradient get gradient => AppTheme.of(this).gradient;
}
