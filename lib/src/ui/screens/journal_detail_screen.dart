import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/my_app_bar.dart';

class JournalDetailScreen extends StatefulWidget {
  const JournalDetailScreen({super.key});

  static const String routeName = "/journal-details";

  @override
  State<JournalDetailScreen> createState() => _JournalDetailView();
}

class _JournalDetailView extends State<JournalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Detail jurnal",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.date_range_outlined,
                                      color: ColorConstant.black,
                                    ),
                                    SizedBox(width: 5,),
                                    Text("Rabu, 12 September 2024", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                    ),),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit_note),
                                  color: ColorConstant.black,
                                )
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: ColorConstant.gray,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has "
                                "been the industry's standard dummy text ever since the 1500s, when an unknown printer took a "
                                "galley of type and scrambled it to make a type specimen book. It has survived not only five "
                                "centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It "
                                "was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum "
                                "passages, and more recently with desktop publishing software like Aldus PageMaker including "
                                "versions of Lorem Ipsum",
                                maxLines: 3,
                                style: TextStyle(fontSize: 15, fontFamily: "Poppins", overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              )),
        ),
      ),
    );
  }
}
