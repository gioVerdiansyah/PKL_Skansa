import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/base_screen.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/permit_screen.dart';

class ScreenRoutes {
  static const String baseRoute = BaseScreen.routeName;
  static const String permitRoute = PermitScreen.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    PageTransition to(Widget w, {int d = 300, PageTransitionType t = PageTransitionType.bottomToTop}){
      return PageTransition(
        child: w,
        type: t,
        duration: Duration(milliseconds: d),
        reverseDuration: Duration(milliseconds: d),
        settings: settings
      );
    }

    switch (settings.name) {
      case baseRoute:
        return to(const BaseScreen());
      case permitRoute:
        return to(const PermitScreen());
      default:
        return to(const BaseScreen());
    }
  }
}
