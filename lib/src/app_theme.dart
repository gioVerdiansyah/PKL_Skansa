import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';

class AppTheme {
  static void setDarkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }

  static ThemeData darkNavigationBarTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: ColorConstant.primary),
      fontFamily: "Roboto",
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
  }
}

class DarkNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppTheme.setDarkStatusBar();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppTheme.setDarkStatusBar();
  }
}