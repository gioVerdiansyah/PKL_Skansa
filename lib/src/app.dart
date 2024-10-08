import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screen_routes.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PKL SMKN 1 Mejayan',
      initialRoute: ScreenRoutes.baseRoute,
      onGenerateRoute: (RouteSettings routeSettings) => ScreenRoutes.generateRoute(routeSettings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConstant.primary),
        fontFamily: "Roboto",
        useMaterial3: true,
      ),
    );
  }
}