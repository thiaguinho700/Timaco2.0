import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projeto/Pages/MorePage/MorePage.dart';
import 'package:projeto/Pages/ChatPage/ChatPage.dart';
// import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:projeto/Pages/MainTImesPage/MainTimesPage.dart';
import 'package:projeto/Pages/MainEventoPage/MainEventoPage.dart';

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
      bottomNavigationBar: GNav(
        color: Colors.black,
        activeColor: ColorsPaleta().red,
        duration: const Duration(milliseconds: 800),
        tabs: [
          _buildGButton(Icons.calendar_today_rounded, 0, indexCurrent),
          _buildGButton(Icons.people_alt_outlined, 1, indexCurrent),
          _buildGButton(Icons.chat_bubble_outline_rounded, 2, indexCurrent),
          _buildGButton(Icons.menu_sharp, 3, indexCurrent),
        ],
        onTabChange: onTap,
        selectedIndex: indexCurrent,
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

  GButton _buildGButton(IconData icon, int index, int currentIndex) {
    return GButton(
        rippleColor: ColorsPaleta().backgroundColorBottomNabBar,
        icon: icon,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: index == currentIndex ? 30 : 0,
              height: 3,
              decoration: BoxDecoration(color: ColorsPaleta().orange),
            ),
            const SizedBox(
              height: 5,
            ),
            Icon(
              icon,
              size: 30.0,
            ),
          ],
        ));
  }
}
