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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Map<String, dynamic>> _dataDummies = [];

  @override
  void initState() {
    super.initState();
    _loadData(15);
  }

  Future<void> _loadData(int count)async{
    for(int i = 0; i <= count; i++){
      await Future.delayed(const Duration(milliseconds: 300));
      _dataDummies.add({
        'status': 'Hadir',
        'tanggal': 'Kamis, 20 Oktober 2024',
        'datang': '08:00:32',
        'pulang': '16:23:32',
        'telat': '15 menit 05 detik'
      });
      _listKey.currentState?.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Detail Absensi",
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _dataDummies.length,
        itemBuilder: (context, index, animation){
          var data = _dataDummies[index];

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero
            ).animate(animation),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                color: ColorConstant.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Datang",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data["datang"],
                            style: const TextStyle(color: ColorConstant.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Pulang",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data['pulang'],
                            style: const TextStyle(color: ColorConstant.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Telat",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data['telat'],
                            style: const TextStyle(color: ColorConstant.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Status",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data['status'],
                            style: const TextStyle(color: ColorConstant.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(data['tanggal'], textAlign: TextAlign.end, style: const TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
