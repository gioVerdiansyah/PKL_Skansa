import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pkl_smkn1mejayan_siswa/src/app.dart';

void main() async {
  // await initializeDateFormatting('id_ID', null);
  await GetStorage.init();
  await Geolocator.requestPermission();

  runApp(const App());
}