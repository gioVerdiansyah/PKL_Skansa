import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/my_app_bar.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/text_input.dart';

import '../../constants/color_constant.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  static const String routeName = "/change-password";

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordView();
}

class _ChangePasswordView extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: "Ganti password",
          rightWidget: TextButton(
            onPressed: () {},
            child: const Text("Simpan", style: TextStyle(
                color: ColorConstant.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
          )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            TextInput.password(
              name: 'old_password',
              labelText: "Password lama",
            ),
            const SizedBox(height: 20,),
            TextInput.password(
              name: 'new_password',
              labelText: "Password baru",
            ),
            const SizedBox(height: 20,),
            TextInput.password(
              name: 'confirm_password',
              labelText: "Ulangi Password baru",
            ),
          ],
        ),
      ),
    );
  }
}