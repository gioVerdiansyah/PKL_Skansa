import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';

import '../../utils/int_handler.dart';

class ShowDialog {
  static Future<bool?> confirm({
    required BuildContext context,
    required String title,
    required String content,
    String cancelText = 'Batal',
    String continueText = 'Lanjut',
    bool suggestOnCancel = false,
    VoidCallback? onCancel,
    VoidCallback? onContinue,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(
            title,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: calculateFontSize(title,
                    startAt: 12, decrementPerStep: 0.3, baseFontSize: 18, charactersPerStep: 6, minFontSize: 10.5),
                fontWeight: FontWeight.bold),
          ),
          content: Text(
            content,
            style: const TextStyle(fontFamily: "Poppins"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
                if (onCancel != null) onCancel();
              },
              style: ButtonStyle(
                shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                backgroundColor: suggestOnCancel
                    ? WidgetStateProperty.all(ColorConstant.secondary)
                    : WidgetStateProperty.all(ColorConstant.semiGray),
              ),
              child: Text(
                cancelText,
                style: TextStyle(
                    color: suggestOnCancel ? ColorConstant.white : ColorConstant.black, fontWeight: FontWeight.w500),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                if (onContinue != null) onContinue();
              },
              style: ButtonStyle(
                shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                backgroundColor: !suggestOnCancel
                    ? WidgetStateProperty.all(ColorConstant.secondary)
                    : WidgetStateProperty.all(ColorConstant.semiGray),
              ),
              child: Text(
                continueText,
                style: TextStyle(
                    color: !suggestOnCancel ? ColorConstant.white : ColorConstant.black, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> simple({
    required BuildContext context,
    required String title,
    required String content,
    String okText = 'Okey',
    VoidCallback? onContinue,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onContinue != null) onContinue();
              },
              style: ButtonStyle(
                shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                backgroundColor: WidgetStateProperty.all(Colors.green),
              ),
              child: Text(
                okText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
