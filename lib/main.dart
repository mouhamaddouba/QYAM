import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qyam/app/core/utils/app_network_utils.dart';

import 'app.dart';

Future<void> main() async {
  /// For check internet connection
  AppNetworkUtilsImpl.init();

  /// Localized Calender
  await initializeDateFormatting();

  /// Always make the screen vertical
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  /// Init GetStorage
  await GetStorage.init();

  runApp(
    /// Response UI
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return const App();
      },
    ),
  );
}
