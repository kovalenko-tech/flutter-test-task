import 'package:apptest/common/theme/app_theme_color_scheme.dart';
import 'package:flutter/material.dart';

class AppGradient {
  AppGradient({
    required this.buttonGradient,
  });

  final Gradient buttonGradient;

  factory AppGradient.byColorScheme(
    AppThemeColorScheme colorScheme,
  ) =>
      AppGradient(
        buttonGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.darkSlateBlue,
            colorScheme.regentGrey,
          ],
        ),
      );
}
