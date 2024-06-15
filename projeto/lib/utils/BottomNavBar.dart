import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projeto/Pages/MorePage/MorePage.dart';
import 'package:projeto/Pages/ChatPage/ChatPage.dart';
// import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:projeto/Pages/MainTImesPage/MainTImesPage.dart';
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
      bottomNavigationBar: SizedBox(
        height: 30,
        // child: GNav(
        //   color: Colors.black,
        //   iconSize: 28,
        //   activeColor: ColorsPaleta().red,
        //   textSize: 40.0,
        //   duration: const Duration(milliseconds: 800),
        //   tabs: [
        //     _buildGButton(Icons.calendar_today_rounded, 0),
        //     _buildGButton(Icons.people_alt_outlined, 1),
        //     _buildGButton(Icons.chat_bubble_outline_rounded, 2),
        //     _buildGButton(Icons.menu_sharp, 3),
        //   ],
        //   onTabChange: onTap,
        //   selectedIndex: indexCurrent,
        // ),
        child: DotNavigationBar(),
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

  GButton _buildGButton(IconData icon, int index) {
    return GButton(
      gap: 5,
      icon: icon,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -2,
            child: Visibility(
              visible: indexCurrent == index,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: ColorsPaleta().mainTextColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
