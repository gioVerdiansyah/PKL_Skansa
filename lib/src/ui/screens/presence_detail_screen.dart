import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/my_app_bar.dart';

import '../../constants/color_constant.dart';

class PresenceDetailScreen extends StatefulWidget {
  const PresenceDetailScreen({
    super.key,
  });

  static const String routeName = "/presence-details";

  @override
  State<PresenceDetailScreen> createState() => _PresenceDetailView();
}

class _PresenceDetailView extends State<PresenceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Detail Absensi",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
        child: Column(
          children: List.generate(
            10,
            (index) => const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Card(
                color: ColorConstant.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hadir",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "08:00:32",
                            style: TextStyle(color: ColorConstant.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hadir",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "16:23:32",
                            style: TextStyle(color: ColorConstant.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Telat",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "5 menit",
                            style: TextStyle(color: ColorConstant.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Status",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Hadir",
                            style: TextStyle(color: ColorConstant.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Kamis, 12 Oktober 2024", textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
