import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';
import 'package:toastification/toastification.dart';

class Alert {
  static error(BuildContext context, String title, {String? messages, int? duration}) {
    return _showAlert(
      context: context,
      title: title,
      messages: messages,
      duration: duration,
      type: ToastificationType.error,
      icon: Icons.close_rounded,
    );
  }

  static success(BuildContext context, String title, {String? messages, int? duration}) {
    return _showAlert(
      context: context,
      title: title,
      messages: messages,
      duration: duration,
      type: ToastificationType.success,
      icon: Icons.check,
    );
  }

  static warning(BuildContext context, String title, {String? messages, int? duration}) {
    return _showAlert(
      context: context,
      title: title,
      messages: messages,
      duration: duration,
      type: ToastificationType.warning,
      icon: Icons.info_outline_rounded,
    );
  }

  static _showAlert({
    required BuildContext context,
    required String title,
    required ToastificationType type,
    required IconData icon,
    String? messages,
    int? duration,
  }) {
    return toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: (duration != null) ? Duration(milliseconds: duration) : const Duration(milliseconds: 15000),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.black),),
      description: (messages != null) ? RichText(text: TextSpan(text: messages, style: const TextStyle(color: ColorConstant.black))
      ) : null,
      icon: Icon(icon),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: false
    );
  }
}
