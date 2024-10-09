import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/asset_constant.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screen_routes.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/utils/string_handler.dart';

import '../../constants/color_constant.dart';
import '../components/fragments/profile/list_tile_to.dart';
import '../utils/scroll_notification_handler.dart';

class ProfileScreen extends StatefulWidget {
  final void Function(bool isVisible) isHideBottomNavBar;

  const ProfileScreen({super.key, required this.isHideBottomNavBar});

  @override
  State<ProfileScreen> createState() => _ProfileView();
}

class _ProfileView extends State<ProfileScreen> with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    String name = "Sofyan Gio Verdiansyah";

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) => handleScrollNotification(notification, widget.isHideBottomNavBar),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            fit: BoxFit.cover,
                            AssetConstant.maleProfile,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "XII RPL 2 | 25",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: ColorConstant.gray),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: calculateFontSize(name, startAt: 60), fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "gioverdiansyah@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: ColorConstant.gray
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    const ListTileTo(
                      icon: Icons.person,
                      title: "Edit Profil",
                      to: ScreenRoutes.journalDetailRoute,
                    ),
                    const ListTileTo(
                      icon: Icons.password_rounded,
                      title: "Ganti password",
                      to: ScreenRoutes.journalDetailRoute,
                    ),
                    const ListTileTo(
                      icon: Icons.checklist_rounded,
                      title: "Histori absensi",
                      to: ScreenRoutes.presenceDetailRoute,
                    ),
                    const ListTileTo(
                      icon: Icons.book_rounded,
                      title: "Histori jurnal",
                      to: ScreenRoutes.journalDetailRoute,
                    ),
                    const ListTileTo(
                      icon: Icons.logout_outlined,
                      title: "Logout",
                      to: ScreenRoutes.journalDetailRoute,
                      isEnd: true,
                      color: ColorConstant.red,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
