import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';
import 'dart:ui';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? rightWidget;

  const MyAppBar({
    Key? key,
    required this.title,
    this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstant.white.withOpacity(0.2),
                ColorConstant.white.withOpacity(0.1),
              ],
            ),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.black, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: ColorConstant.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            centerTitle: true,
            actions: rightWidget != null ? [rightWidget!] : null,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              side: const BorderSide(
                color: ColorConstant.gray,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}