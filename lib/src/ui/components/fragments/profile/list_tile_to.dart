import 'package:flutter/material.dart';

import '../../../../constants/color_constant.dart';

class ListTileClick extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onClick;
  final Color? color;
  final bool isEnd;

  const ListTileClick({super.key, required this.icon, required this.title, required this.onClick, this.color, this.isEnd =
  false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(border: Border(
          top: const BorderSide(color: ColorConstant.gray),
          bottom: isEnd ? const BorderSide(color: ColorConstant.gray) : BorderSide.none
        )),
        child: TextButton(
          onPressed: onClick,
          style: const ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: ColorConstant.semiWhite,
                    radius: 18,
                    child: Icon(icon, color: (color != null) ? color : null,),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: (color != null) ? color : ColorConstant.black, fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
              Icon(
                Icons.chevron_right,
                size: 35,
                color: (color != null) ? color : ColorConstant.black,
              )
            ],
          ),
        ));
  }
}
