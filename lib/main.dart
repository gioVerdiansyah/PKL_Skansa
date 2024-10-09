import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pkl_smkn1mejayan_siswa/src/app.dart';
import 'package:pkl_smkn1mejayan_siswa/src/app_theme.dart';

void main() async {
  Intl.defaultLocale = 'id_ID';
  await GetStorage.init();
  await Geolocator.requestPermission();

  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.setDarkStatusBar();

  runApp(const App());
}