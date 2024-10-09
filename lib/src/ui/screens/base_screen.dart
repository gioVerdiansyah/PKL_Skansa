import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkl_smkn1mejayan_siswa/src/blocs/bloc/fill_journal_bloc.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/fragments/base/journal_tab.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/fragments/base/presence_tab.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/home_screen.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  static const String routeName = "/base";

  @override
  State<BaseScreen> createState() => _BaseView();
}

class _BaseView extends State<BaseScreen> with SingleTickerProviderStateMixin {
  TextEditingController descriptionController = TextEditingController();
  int _selectedIndex = 0;
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      const HomeScreen(),
      Text(
        'Index 1: Business',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Text(
        'Index 2: School',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Text(
        'Index 3: Settings',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FillJournalBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_time_filled_rounded),
                  label: 'Home',
                  backgroundColor: ColorConstant.primary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  label: 'Profil',
                  backgroundColor: ColorConstant.primary,
                ),
              ],
              backgroundColor: ColorConstant.primary,
              currentIndex: _selectedIndex,
              selectedItemColor: ColorConstant.warm,
              onTap: _onItemTapped,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            width: 63,
            height: 63,
            child: FloatingActionButton(
              elevation: 2,
              shape: const CircleBorder(),
              backgroundColor: ColorConstant.light,
              onPressed: () {
                final fillJournalBloc = context.read<FillJournalBloc>();

                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  isScrollControlled: true,
                  isDismissible: true,
                  enableDrag: true,
                  builder: (BuildContext bottomSheetContext) {
                    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

                    return BlocProvider.value(
                      value: fillJournalBloc,
                      child: DefaultTabController(
                        length: 2,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const TabBar(
                                indicatorColor: Colors.green,
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(text: "Absensi"),
                                  Tab(text: "Jurnal"),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: keyboardHeight > 0 ? 530 : 350,
                                child: TabBarView(
                                  children: [
                                    PresenceTab(context: bottomSheetContext),
                                    JournalTab(context: bottomSheetContext)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Icon(
                Icons.fingerprint_rounded,
                size: 30,
              ),
            ),
          ),
        );
      }),
    );
  }
}
