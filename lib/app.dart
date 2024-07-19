import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam/app/core/themes/app_themes.dart';
import 'package:qyam/app/core/translations/app_translations.dart';
import 'package:qyam/app/core/values/app_strings.dart';
import 'package:qyam/app/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: AppStrings.appName.tr,

      /// Routing
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,

      /// Theme
      theme: AppThemes.getAppTheme(),
      darkTheme: AppThemes.getAppDarkTheme(),
      themeMode: AppThemes.getAppThemeMode(),

      /// Locale
      locale: AppTranslations.getAppLocale(),
      translations: AppTranslations(),
    );
  }
}
