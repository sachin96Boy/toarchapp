import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/styles/app_color_extention.dart';
import 'package:tourch_app/styles/app_text_theme_extention.dart';
import 'package:tourch_app/styles/app_typography.dart';

class AppTheme extends Notifier<ThemeMode> {
  //
  // Light theme
  //

  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        bodyMedium: AppTypography.body1.copyWith(color: Colors.black),
      ),
      extensions: [_lightAppColors, _lightTextTheme],
    );
  }();

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffb00020),
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );
  static final _lightTextTheme = AppTextThemeExtension(
    displayLarge: AppTypography.h1.copyWith(color: Colors.black),
    displayMedium: AppTypography.h1.copyWith(color: Colors.black),
    displaySmall: AppTypography.h1.copyWith(color: Colors.black),
    headlineLarge: AppTypography.h1.copyWith(color: Colors.black),
    headlineMedium: AppTypography.h1.copyWith(color: Colors.black),
    headlineSmall: AppTypography.h1.copyWith(color: Colors.black),
    titleLarge: AppTypography.body1.copyWith(color: Colors.black),
    titleMedium: AppTypography.body1.copyWith(color: Colors.black),
    titleSmall: AppTypography.body1.copyWith(color: Colors.black),
    bodyLarge: AppTypography.body1.copyWith(
      color: _lightAppColors.onBackground,
    ),
    bodyMedium: AppTypography.body1.copyWith(
      color: _lightAppColors.onBackground,
    ),
    bodySmall: AppTypography.body1.copyWith(
      color: _lightAppColors.onBackground,
    ),
    labelLarge: AppTypography.body1.copyWith(color: Colors.black),
  );
  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(extensions: [_darkAppColors]);

  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xffbb86fc),
    onPrimary: Colors.black,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffcf6679),
    onError: Colors.black,
    background: const Color(0xff121212),
    onBackground: Colors.white,
    surface: const Color(0xff121212),
    onSurface: Colors.white,
  );

  @override
  ThemeMode build() {
    // TODO: implement build
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode themeMode) {
    state = themeMode;
  }
}

final themeProvider = NotifierProvider<AppTheme, ThemeMode>(() {
  return AppTheme();
});

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  AppTextThemeExtension get appTextTheme =>
      extension<AppTextThemeExtension>() ?? AppTheme._lightTextTheme;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
