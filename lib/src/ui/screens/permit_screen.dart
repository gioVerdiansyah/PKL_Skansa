import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text("Izin"),
      ),
    );
  }
}