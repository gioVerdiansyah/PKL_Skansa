import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkl_smkn1mejayan_siswa/src/blocs/bloc/fill_journal_bloc.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/fragments/base/journal_tab.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/fragments/base/presence_tab.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/home_screen.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/screens/profile_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  static const String routeName = "/base";

  @override
  State<BaseScreen> createState() => _BaseView();
}

class _BaseView extends State<BaseScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  TextEditingController descriptionController = TextEditingController();
  int _selectedIndex = 0;
  late List<Widget> _pages;
  bool _isVisible = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300))..value = 1;

    _pages = <Widget>[
      HomeScreen(isHideBottomNavBar: toggleBottomNavBar),
      ProfileScreen(isHideBottomNavBar: toggleBottomNavBar)
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
          bottomNavigationBar: SizeTransition(
            sizeFactor: animationController,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
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
                unselectedItemColor: ColorConstant.white,
                onTap: _onItemTapped,
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isVisible ? 63 : 0,
            width: 63,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 2,
                shape: const CircleBorder(),
                backgroundColor: ColorConstant.light,
                onPressed: _isVisible ? () {
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
                } : null,
                child: const Icon(
                  Icons.fingerprint_rounded,
                  size: 30,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void toggleBottomNavBar(bool isVisible) {
    if (isVisible != _isVisible) {
      setState(() {
        _isVisible = isVisible;
      });
    }
    if (isVisible) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }
}