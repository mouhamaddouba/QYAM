import 'package:flutter/material.dart';

abstract class AppColors {
  ///region light color scheme
  static const Color primary = Color(0xFF3e5aa9);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFdbe1ff);
  static const Color onPrimaryContainer = Color(0xFF00174b);

  static const Color secondary = Color(0xFF006684);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFbee9ff);
  static const Color onSecondaryContainer = Color(0xFF001f2a);

  static const Color error = Color(0xFFba1a1a);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFffdad6);
  static const Color onErrorContainer = Color(0xFF410002);

  static const Color outline = Color(0xFF757680);
  static const Color darkOutline = Color(0xFFc5c6d0);

  static const Color background = Color(0xFFfafcff);
  static const Color onBackground = Color(0xFF001f2a);

  static const Color surface = Color(0xFFfafcff);
  static const Color onSurface = Color(0xFF001f2a);
  static const Color surfaceVariant = Color(0xFFe2e2ec);
  static const Color onSurfaceVariant = Color(0xFF45464f);

  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);

  static const Color containerTab = Color(0xffdbe1ff);
  static const Color darkContainerTab = Color(0xff234290);

  ///region dark color scheme
  static const Color darkPrimary = Color(0xFFb4c5ff);
  static const Color darkOnPrimary = Color(0xFF002a78);
  static const Color darkPrimaryContainer = Color(0xFF234290);
  static const Color darkOnPrimaryContainer = Color(0xFFdbe1ff);
  static const Color darkSecondary = Color(0xFF69d3ff);
  static const Color darkOnSecondary = Color(0xFF003546);
  static const Color darkSecondaryContainer = Color(0xFF004d64);
  static const Color darkOnSecondaryContainer = Color(0xFFbee9ff);
  static const Color darkError = Color(0xFFffb4ab);
  static const Color darkOnError = Color(0xFF690005);
  static const Color darkErrorContainer = Color(0xFF93000a);
  static const Color darkOnErrorContainer = Color(0xFFffdad6);
  static const Color darkBackground = Color(0xFF001f2a);
  static const Color darkOnBackground = Color(0xFFbfe9ff);
  static const Color darkSurface = Color(0xFF001f2a);
  static const Color darkOnSurface = Color(0xFFbfe9ff);
  static const Color darkSurfaceVariant = Color(0xFF45464f);
  static const Color darkOnSurfaceVariant = Color(0xFFc5c6d0);
  static const Color darkShadow = Color(0xFF000000);
  static const Color darkScrim = Color(0xFF000000);

  ///region primary light
  static const Color white01 = Colors.white;
  static const Color whiteBlue = Color(0xfff3f7fb);
  static const Color iconLight = onLight300;
  static const Color gray01 = Color(0xFFF5F5F4);
  static const Color gray02 = Color(0xFFD9D9D9);
  static const Color gray03 = Color(0xFF959494);
  static const Color gray04 = Color(0xFFfafafa);
  static const Color onLight300 = Color(0xFF939393);
  static const Color onLight500 = Color(0xFFF0F0F0);
  static const Color black00 = Color(0x00000000);
  static const Color black01 = Color(0xFF08010E);
  static const Color black02 = Color(0x8f000000);
  static const Color red01 = Color(0xFFEA6666);

  ///region usecase dialog
  static const Color errorLight = Color(0xff891820);
  static const Color warningLight = Color(0xffe7831c);
  static const Color successLight = Color(0xff09964b);

  ///region gradient light
  static const LinearGradient linearGradient01 = LinearGradient(
    begin: AlignmentDirectional.bottomStart,
    end: AlignmentDirectional.topEnd,
    colors: [primary, onPrimaryContainer],
    stops: [0.2, 1.8],
  );

  ///region gradient dark
  static const LinearGradient darkLinearGradient01 = LinearGradient(
    begin: AlignmentDirectional.bottomStart,
    end: AlignmentDirectional.topEnd,
    colors: [darkPrimary, darkOnPrimaryContainer],
    stops: [0.6, 1.9],
  );
}
