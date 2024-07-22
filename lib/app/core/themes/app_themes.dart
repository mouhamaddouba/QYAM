// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/storage/app_storage.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

abstract class AppThemes {
  //region Themes & Fonts Keys
  //static const String appTheme = "appTheme";
  static const String appFontFamily = "Bukra";
  static const String theme01 = "theme01";
  static const String theme02 = "theme02";
  //endregion Themes & Fonts Keys

  // static final ThemeData _darkDefault = ThemeData.dark();
  // static final ThemeData _lightDefault = ThemeData.light();

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    cardColor: AppColors.primaryContainer,
    focusColor: AppColors.secondary,
    canvasColor: AppColors.secondaryContainer,
    // errorColor: AppColors.error,
    hoverColor: AppColors.errorContainer,
    scaffoldBackgroundColor: AppColors.background,
    shadowColor: AppColors.shadow,
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: AppColors.primary,
        fontSize: AppDimensions.fontSize09.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.appFontFamily,
      ),
      titleMedium: TextStyle(
        color: AppColors.onPrimary,
        fontSize: AppDimensions.fontSize12.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      titleLarge: TextStyle(
        color: AppColors.onPrimary,
        fontSize: AppDimensions.fontSize14.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      displaySmall: TextStyle(
        color: AppColors.onPrimaryContainer,
        fontSize: AppDimensions.fontSize09.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      displayMedium: TextStyle(
        color: AppColors.primary,
        fontSize: AppDimensions.fontSize10.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.appFontFamily,
      ),
      displayLarge: TextStyle(
        color: AppColors.onBackground,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
        height: AppDimensions.height02,
      ),
      bodySmall: TextStyle(
        color: AppColors.onBackground,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      bodyMedium: TextStyle(
        color: AppColors.outline,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primary,
        fontSize: AppDimensions.fontSize12.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.appFontFamily,
      ),
      headlineLarge: TextStyle(
        color: AppColors.onPrimary,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      headlineMedium: TextStyle(
        color: AppColors.primary,
        fontSize: AppDimensions.fontSize09.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
        height: AppDimensions.height02,
      ),
      //
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    cardColor: AppColors.darkPrimaryContainer,
    focusColor: AppColors.darkSecondary,
    canvasColor: AppColors.darkSecondaryContainer,
    // errorColor: AppColors.darkError,
    hoverColor: AppColors.darkErrorContainer,
    scaffoldBackgroundColor: AppColors.darkBackground,
    shadowColor: AppColors.shadow,
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: AppColors.darkOnPrimaryContainer,
        fontSize: AppDimensions.fontSize09.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.appFontFamily,
      ),
      titleMedium: TextStyle(
        color: AppColors.darkOnPrimary,
        fontSize: AppDimensions.fontSize12.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      titleLarge: TextStyle(
        color: AppColors.darkOnPrimary,
        fontSize: AppDimensions.fontSize14.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      displaySmall: TextStyle(
        color: AppColors.white01,
        fontSize: AppDimensions.fontSize09.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      displayMedium: TextStyle(
        color: AppColors.darkPrimary,
        fontSize: AppDimensions.fontSize10.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.appFontFamily,
      ),
      displayLarge: TextStyle(
        color: AppColors.darkOnBackground,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
        height: AppDimensions.height02,
      ),
      bodySmall: TextStyle(
        color: AppColors.darkOnBackground,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkOutline,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkOnPrimaryContainer,
        fontSize: AppDimensions.fontSize12.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.appFontFamily,
      ),
      headlineLarge: TextStyle(
        color: AppColors.darkOnPrimary,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      headlineMedium: TextStyle(
        color: AppColors.darkPrimary,
        fontSize: AppDimensions.fontSize09.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
        height: AppDimensions.height02,
      ),
      //
    ),
  );

  // Keys [theme01, theme02]
  static void changeTheme({
    required String theme,
    required bool isDarkMode,
  }) async {
    await AppStorage.write(
      AppStorage.theme,
      theme,
    );

    await AppStorage.write(
      AppStorage.isDarkMode,
      isDarkMode,
    );

    final ThemeData themeData = _getThemeData(
      theme: theme,
      isDarkMode: isDarkMode,
    );

    Get.changeTheme(
      themeData,
    );

    Get.changeThemeMode(
      getAppThemeMode(),
    );
  }

  static ThemeData getAppTheme() {
    final theme = AppStorage.read<String>(
      AppStorage.theme,
      theme01,
    );

    return _getThemeData(
      theme: theme,
      isDarkMode: false,
    );
  }

  static ThemeData getAppDarkTheme() {
    final theme = AppStorage.read<String>(
      AppStorage.theme,
      theme02,
    );

    return _getThemeData(
      theme: theme,
      isDarkMode: true,
    );
  }

  static ThemeMode getAppThemeMode() {
    final isDarkMode = AppStorage.read<bool>(
      AppStorage.isDarkMode,
      false,
    );

    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static ThemeData _getThemeData({
    required String theme,
    required bool isDarkMode,
  }) {
    final ThemeData themeData;

    // if (isDarkMode) {
    //   if (theme == theme01) {
    //     themeData = _lightTheme;
    //   } else {
    //     themeData = _lightDefault;
    //   }
    // } else {
    //   if (theme == theme02) {
    //     themeData = _darkTheme;
    //   } else {
    //     themeData = _darkDefault;
    //   }
    // }

    if (isDarkMode) {
      themeData = _darkTheme;
    } else {
      themeData = _lightTheme;
    }

    //themeData = _lightTheme;

    return themeData;
  }
}
