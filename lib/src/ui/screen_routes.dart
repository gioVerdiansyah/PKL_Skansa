import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/base_screen.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/change_password_screen.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/edit_profile_screen.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/journal_detail_screen.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/permit_screen.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/presence_detail_screen.dart';

class ScreenRoutes {
  static const String baseRoute = BaseScreen.routeName;
  static const String permitRoute = PermitScreen.routeName;
  static const String presenceDetailRoute = PresenceDetailScreen.routeName;
  static const String journalDetailRoute = JournalDetailScreen.routeName;
  static const String editProfileRoute = EditProfileScreen.routeName;
  static const String changePasswordRoute = ChangePasswordScreen.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    PageTransition to(Widget w, {int d = 300, PageTransitionType t = PageTransitionType.bottomToTop}) {
      return PageTransition(
          child: w,
          type: t,
          duration: Duration(milliseconds: d),
          reverseDuration: Duration(milliseconds: d),
          settings: settings);
    }

    switch (settings.name) {
      case baseRoute:
        return to(const BaseScreen());
      case permitRoute:
        return to(const PermitScreen());
      case presenceDetailRoute:
        return to(const PresenceDetailScreen(), t: PageTransitionType.rightToLeft);
      case journalDetailRoute:
        return to(const JournalDetailScreen(), t: PageTransitionType.rightToLeft);
      case editProfileRoute:
        return to(const EditProfileScreen(), t: PageTransitionType.rightToLeft);
      case changePasswordRoute:
        return to(const ChangePasswordScreen(), t: PageTransitionType.rightToLeft);
      default:
        return to(const BaseScreen());
    }
  }
}
