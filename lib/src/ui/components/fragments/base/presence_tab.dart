import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/alert.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screen_routes.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/utils/location_handler.dart';

class PresenceTab extends StatefulWidget {
  final BuildContext context;

  const PresenceTab({super.key, required this.context});

  @override
State<PresenceTab> createState() => _PresenceTab();
}

class _PresenceTab extends State<PresenceTab> {
  String _selectedPresence = "Hadir";
  List<String> options = ["Hadir", "Pulang", "WFH"];
  LocationHandler currentLocation = LocationHandler();

  void _onSelectedPresence(String value) {
    setState(() {
      _selectedPresence = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Column(
            children: List.generate(options.length, (index) {
              int value = options.indexOf(_selectedPresence);
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: OutlinedButton(
                  onPressed: () => _onSelectedPresence(options[index]),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(color: (value == index) ? ColorConstant.secondary : Colors.black),
                    backgroundColor: (value == index) ? ColorConstant.secondary : ColorConstant.white,
                    minimumSize: const Size(250, 50),
                  ),
                  child: Text(
                    options[index],
                    style: TextStyle(
                      color: (value == index) ? ColorConstant.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, ScreenRoutes.permitRoute),
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                side: WidgetStateProperty.resolveWith<BorderSide>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const BorderSide(color: ColorConstant.secondary);
                  }
                  return const BorderSide(color: Colors.black);
                }),
                backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return ColorConstant.secondary;
                  }
                  return ColorConstant.white;
                }),
                foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return ColorConstant.white;
                  }
                  return Colors.black;
                }),
                minimumSize: WidgetStateProperty.all<Size>(const Size(250, 50)),
              ),
              child: const Text("Izin"),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: SwipeButton.expand(
              borderRadius: BorderRadius.circular(10),
              thumbPadding: const EdgeInsets.all(5),
              thumb: const Icon(
                Icons.double_arrow_rounded,
                color: Colors.white,
              ),
              elevationThumb: 3,
              activeThumbColor: ColorConstant.secondary,
              activeTrackColor: ColorConstant.semiWhite,
              elevationTrack: 3,
              child: const Text(
                "Absen GO...",
                style: TextStyle(
                  color: ColorConstant.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onSwipe: () async{
                // TODO: SEND TO API

                // String? locationString = await currentLocation.getCurrentLocationAsString();
                print(_selectedPresence);
                // print(locationString);
                Navigator.pop(widget.context);
                Alert.success(context,"Berhasil absen, Namun", messages: "Anda telat 10 menit");
              },
            ),
          )
        ],
      ),
    );
  }
}
