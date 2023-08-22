import 'package:apptest/common/theme/app_theme_color_scheme.dart';
import 'package:flutter/material.dart';

class AppGradient {
  AppGradient({
    required this.buttonGradient,
    required this.topPickerGradient,
    required this.bottomPickerGradient,
  });

  final Gradient buttonGradient;
  final Gradient topPickerGradient;
  final Gradient bottomPickerGradient;

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
        topPickerGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.white,
            colorScheme.white.withOpacity(0.9),
            colorScheme.white.withOpacity(0.9),
            colorScheme.white.withOpacity(0.7),
            colorScheme.white.withOpacity(0.7),
          ],
        ),
        bottomPickerGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.white,
            colorScheme.white.withOpacity(0.7),
            colorScheme.white.withOpacity(0.7),
            colorScheme.white.withOpacity(0.9),
            colorScheme.white.withOpacity(0.9),
          ],
        ),
      );
}
