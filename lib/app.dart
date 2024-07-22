import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/translations/app_translations.dart';
import 'package:qyam_novers_mobile/app/core/themes/app_themes.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: AppStrings.appName.tr,

      // Routing
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,

      // Theme
      theme: AppThemes.getAppTheme(),
      darkTheme: AppThemes.getAppDarkTheme(),
      themeMode: AppThemes.getAppThemeMode(),

      // Locale
      locale: AppTranslations.getAppLocale(),
      translations: AppTranslations(),
    );
  }
}
