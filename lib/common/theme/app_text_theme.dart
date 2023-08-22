import 'dart:ui';

import 'package:apptest/common/theme/app_theme_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme extends TextTheme {
  const AppTextTheme({
    required this.buttonText,
    required this.pirmaryText,
    required this.header1,
    required this.header2,
    required this.header3,
  }) : super();

  factory AppTextTheme.byColorScheme(
    AppThemeColorScheme colorScheme,
  ) =>
      AppTextTheme(
        header1: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.nunito(
            color: colorScheme.black,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
            fontSize: 40.sp,
          ),
        ),
        header2: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.nunito(
            color: colorScheme.black,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
            fontSize: 30.sp,
          ),
        ),
        header3: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.nunito(
            color: colorScheme.black,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
            fontSize: 25.sp,
          ),
        ),
        buttonText: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.nunito(
            color: colorScheme.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20.sp,
          ),
        ),
        pirmaryText: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.nunito(
            color: colorScheme.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20.sp,
          ),
        ),
      );

  final AppThemeTextStyle header1;
  final AppThemeTextStyle header2;
  final AppThemeTextStyle header3;
  final AppThemeTextStyle buttonText;
  final AppThemeTextStyle pirmaryText;
}

class AppThemeTextStyle extends TextStyle {
  const AppThemeTextStyle(
    this.colorScheme, {
    super.inherit,
    super.color,
    super.backgroundColor,
    super.fontFamily,
    super.fontFamilyFallback,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.locale,
    super.foreground,
    super.background,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.shadows,
    super.fontFeatures,
  });

  final AppThemeColorScheme colorScheme;

  @override
  AppThemeTextStyle copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) {
    return AppThemeTextStyle(
      colorScheme,
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null ? color ?? this.color : null,
      backgroundColor: this.background == null && background == null ? backgroundColor ?? this.backgroundColor : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }

  @override
  AppThemeTextStyle merge(TextStyle? other) {
    final merged = super.merge(other);

    return copyWith(
      inherit: merged.inherit,
      color: merged.color,
      backgroundColor: merged.backgroundColor,
      fontFamily: merged.fontFamily,
      fontFamilyFallback: merged.fontFamilyFallback,
      fontSize: merged.fontSize,
      fontWeight: merged.fontWeight,
      fontStyle: merged.fontStyle,
      letterSpacing: merged.letterSpacing,
      wordSpacing: merged.wordSpacing,
      textBaseline: merged.textBaseline,
      height: merged.height,
      locale: merged.locale,
      foreground: merged.foreground,
      background: merged.background,
      shadows: merged.shadows,
      fontFeatures: merged.fontFeatures,
      decoration: merged.decoration,
      decorationColor: merged.decorationColor,
      decorationStyle: merged.decorationStyle,
      decorationThickness: merged.decorationThickness,
      debugLabel: merged.debugLabel,
    );
  }
}
