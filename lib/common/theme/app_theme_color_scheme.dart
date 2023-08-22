import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class AppThemeColorScheme extends ColorScheme {
  const AppThemeColorScheme({
    required super.brightness,
    required this.white,
    required this.black,
    required this.tilight,
    required this.forgetMeNot,
    required this.whiteSmoke,
    required this.silver,
    required this.softPeach,
    required this.darkSlateBlue,
    required this.regentGrey,
  }) : super(
          primary: Colors.black,
          secondary: Colors.black,
          surface: Colors.black,
          background: Colors.black,
          error: Colors.black,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.black,
        );

  static LightColorScheme light = LightColorScheme();
  static DarkColorScheme dark = DarkColorScheme();

  /// I took the name for the colors from the service https://colors.artyclick.com/color-name-finder/
  final Color white;
  final Color black;
  final Color tilight;
  final Color forgetMeNot;
  final Color whiteSmoke;
  final Color silver;
  final Color softPeach;
  final Color darkSlateBlue;
  final Color regentGrey;
}

class LightColorScheme extends AppThemeColorScheme {
  LightColorScheme()
      : super(
          brightness: Brightness.light,
          white: Colors.white,
          black: Colors.black,
          tilight: HexColor('#53538A'),
          forgetMeNot: HexColor('#FFEFEF'),
          whiteSmoke: HexColor('#F6F6F6'),
          silver: HexColor('#CACACA'),
          softPeach: HexColor('#F0EFEF'),
          darkSlateBlue: HexColor('#454581'),
          regentGrey: HexColor('#8D8DB2'),
        );
}

class DarkColorScheme extends LightColorScheme {
  DarkColorScheme();
}

extension ColorFilterExtension on Color {
  ColorFilter get filter => ColorFilter.mode(
        this,
        BlendMode.srcIn,
      );
}
