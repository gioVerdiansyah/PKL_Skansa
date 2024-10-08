import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/asset_constant.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/fragments/home/accordion_history.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screen_routes.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/utils/string_handler.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/utils/location_handler.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';

import '../utils/scroll_notification_handler.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) isHideBottomNavBar;

  const HomeScreen({required this.isHideBottomNavBar});

  @override
  State<HomeScreen> createState() => _HomeView();
}

class _HomeView extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  final LocationHandler locationHandler = LocationHandler();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NotificationListener<ScrollNotification>(
        onNotification: (notification) => handleScrollNotification(notification, widget.isHideBottomNavBar),
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            child: SafeArea(
              child: Column(children: [
                // ! User Profile
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipOval(
                              child: Image.asset(
                            AssetConstant.maleProfile,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          )),
                          const Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "XII RPL 2 | 25",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: ColorConstant.gray),
                                  ),
                                  Text(
                                    "Verdiansyah Verdiansyah Verdiansyah Verdiansyah Verdiansyah Verdiansyah",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: ColorConstant.black),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "12:22:11",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                // ! Main Card
                Card(
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AssetConstant.abstractBackground),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "PKL di:",
                              style: TextStyle(color: ColorConstant.white, fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              truncateAndCapitalize("PT United Tractors", maxLength: 30),
                              style:
                                  const TextStyle(color: ColorConstant.white, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pengawas",
                                  style: TextStyle(
                                      color: ColorConstant.white, fontSize: 13, fontWeight: FontWeight.bold, height: 1.2),
                                ),
                                Text(
                                  "Pembimbing",
                                  style: TextStyle(
                                      color: ColorConstant.white, fontSize: 13, fontWeight: FontWeight.bold, height: 1.2),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    truncateAndCapitalize("Ananda Eka Setyawan", maxLength: 15),
                                    style: const TextStyle(
                                        color: ColorConstant.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    truncateAndCapitalize("Hamdan Aziz", maxLength: 15),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        color: ColorConstant.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.white.withOpacity(0.25),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Blur
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Column(
                                      children: [
                                        Text(
                                          "Check In",
                                          style: TextStyle(fontFamily: "Poppins", fontSize: 9, color: ColorConstant.white),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "12:32:10",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: ColorConstant.white),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 30,
                                      width: 2,
                                      color: ColorConstant.white,
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          "Check Out",
                                          style: TextStyle(fontFamily: "Poppins", fontSize: 9, color: ColorConstant.white),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "--:--:--",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: ColorConstant.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // ? Indicator
                Card(
                  color: ColorConstant.white,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Tingkat kehadiran: ",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: ColorConstant.gray),
                              ),
                            ),

                            // ? Circular Progress Indicator
                            Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween<double>(begin: 0.0, end: 0.83),
                                      duration: const Duration(seconds: 3),
                                      builder: (context, value, _) {
                                        Color color = Color.lerp(Colors.red, Colors.green, value)!;
                                        return CircularProgressIndicator(
                                          value: value,
                                          strokeWidth: 10,
                                          backgroundColor: Colors.grey.shade300,
                                          valueColor: AlwaysStoppedAnimation<Color>(color),
                                        );
                                      },
                                    ),
                                  ),
                                  TweenAnimationBuilder<double>(
                                    tween: Tween<double>(begin: 0.0, end: 0.83 * 100),
                                    duration: const Duration(seconds: 3),
                                    builder: (context, value, _) {
                                      return Text(
                                        '${value.toInt()}%',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontFamily: "OpenSans"),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Keseluruhan: ",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hadir: 25",
                                        style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
                                      ),
                                      Text(
                                        "Telat: 3",
                                        style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Alpha: 2",
                                        style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
                                      ),
                                      Text(
                                        "Total: 30",
                                        style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // ? Location indicator
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          color: ColorConstant.semiWhite,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Jarak dari DuDi",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.gray, fontSize: 10),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("200.90m",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: ColorConstant.black,
                                        fontSize: 20,
                                        fontFamily: "OpenSansSemiCondensed")),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    // TODO: Change to maps
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          color: ColorConstant.semiWhite,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Jarak dari DuDi",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.gray, fontSize: 10),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("200.90m",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.black, fontSize: 20)),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                // ? Presence Histories
                AccordionHistory(
                  headerPadding: EdgeInsets.zero,
                  bodyPadding: EdgeInsets.zero,
                  tileHeader: Column(
                    children: [
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Histori presensi",
                              style: TextStyle(color: ColorConstant.black, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ScreenRoutes.presenceDetailRoute);
                              },
                              child: const Text(
                                "Detail",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ]),
                    ],
                  ),
                  items: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Datang"),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Text("Pulang")
                                ],
                              ),
                              Text("Tanggal")
                            ],
                          ),
                        ),
                        Column(
                          children: List.generate(
                            5,
                            (index) => const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "08:00:32",
                                        style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.black),
                                      ),
                                      SizedBox(width: 25),
                                      Text(
                                        "16:23:32",
                                        style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.black),
                                      )
                                    ],
                                  ),
                                  Text("Selasa, 20 Oktober 2024",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.gray, fontSize: 10))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  initiallyExpanded: true,
                ),
                SizedBox(
                  height: 20,
                ),
                AccordionHistory(
                  headerPadding: EdgeInsets.zero,
                  bodyPadding: EdgeInsets.zero,
                  tileHeader: Column(
                    children: [
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Histori jurnal",
                              style: TextStyle(color: ColorConstant.black, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ScreenRoutes.journalDetailRoute);
                              },
                              child: const Text(
                                "Detail",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ]),
                    ],
                  ),
                  items: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Text("Kegiatan"), Text("Tanggal")],
                          ),
                        ),
                        Column(
                          children: List.generate(
                            5,
                            (index) => const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                        "Ut tempor, elit pellentesque pellentesque malesuada, nulla ipsum placerat lacus, sit amet feugiat risus nisl vel nulla. Nullam gravida mattis elit eu mollis. Nunc porttitor sagittis tempor. In accumsan libero at pellentesque varius. Mauris ultrices purus est, a mollis augue porta sit amet. Pellentesque ac elementum dolor, at sagittis elit. Donec quis ultrices massa. Nullam rhoncus sagittis eleifend",
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 13, overflow: TextOverflow.ellipsis)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text("Selasa, 20 Oktober 2024",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, color: ColorConstant.gray, fontSize: 10)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  initiallyExpanded: true,
                ),
              ]),
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
