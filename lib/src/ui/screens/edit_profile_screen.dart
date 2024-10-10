import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/my_app_bar.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/text_input.dart';

import '../../constants/asset_constant.dart';

class EditProfileScreen extends StatefulWidget{
  const EditProfileScreen({super.key});

  static const String routeName = "/edit-profile";

  @override
  State<EditProfileScreen> createState() => _EditProfileView();
}

class _EditProfileView extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Edit Profil",
        rightWidget: TextButton(
          onPressed: (){},
          child: const Text("Simpan", style: TextStyle(
            color: ColorConstant.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
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
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            TextInput.basic(
              type: TextInputType.emailAddress,
              labelText: "Email",
              name: "email",
              initialValue: "gioVerdiansyah@gmail.com",
            ),
            const SizedBox(height: 20,),
            TextInput.basic(
              type: TextInputType.phone,
              labelText: "Nomor HP",
              name: "no_hp",
              initialValue: "0821345678",
            ),
            const SizedBox(height: 20,),
            TextInput.basic(
              type: TextInputType.phone,
              labelText: "Nomor HP Ortu",
              name: "no_hp_ortu",
            ),
            const SizedBox(height: 20,),
            TextInput.description(
              labelText: "Alamat",
              name: "alamat",
              maxLine: 3,
            ),
          ],
        )
      ),
    );
  }
}