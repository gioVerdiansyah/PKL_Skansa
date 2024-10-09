import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/my_app_bar.dart';

class PresenceDetailScreen extends StatefulWidget{
  const PresenceDetailScreen({super.key, });

  static const String routeName = "/presence-detail";

  @override
  State<PresenceDetailScreen> createState() => _PresenceDetailView();
}

class _PresenceDetailView extends State<PresenceDetailScreen>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      appBar: MyAppBar(
        title: "Detail Absensi",
      ),
    );
  }
}