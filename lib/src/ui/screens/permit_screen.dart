import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/my_app_bar.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screen_routes.dart';

class PermitScreen extends StatefulWidget{
  const PermitScreen({super.key});

  static const String routeName = "/permit";

  @override
  State<PermitScreen> createState() => _PermitView();
}

class _PermitView extends State<PermitScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const MyAppBar(title: "Izin",),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FormBuilder(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: (){
                  //   TODO: SEND TO API

                    Navigator.popUntil(context, ModalRoute.withName(ScreenRoutes.baseRoute));
                  },
                  label: const Text("Submit"),
                  icon: const Icon(Icons.send_rounded),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: ColorConstant.primary,
                    foregroundColor: ColorConstant.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}