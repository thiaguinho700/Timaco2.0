import 'package:flutter/material.dart';
import 'package:projeto/Pages/ChatPage/ChatPage.dart';
import 'package:projeto/Pages/MainEventoPage/MainEventoPage.dart';
import 'package:projeto/Pages/MainTImesPage/MainTImesPage.dart';
import 'package:projeto/Pages/MorePage/MorePage.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int indexCurrent = 0;

  void onTap(int index) {
    setState(() {
      indexCurrent = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 2.0, color: Colors.black))),
        child: GNav(
          color: Colors.black,
          iconSize: 28,
          activeColor: ColorsPaleta().red,
          textSize: 40.0,
          duration: const Duration(milliseconds: 800),
          tabs: const [
            GButton(
              icon: Icons.calendar_today_rounded,
              text: "Eventos",
            ),
            GButton(
              icon: Icons.people_alt_outlined,
              text: "Times",
            ),
            GButton(
              icon: Icons.chat_bubble_outline_rounded,
              text: "Chat",
            ),
            GButton(
              icon: Icons.menu_sharp,
              text: "More",
            ),
          ],
          onTabChange: onTap,
          selectedIndex: indexCurrent,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(indexCurrent),
      ),
    );
  }

  final List<Widget> _widgetOptions = <Widget>[
    const MainEventoPage(),
    const MainTimePage(),
    const ChatPage(),
    const MorePage()
  ];
}
