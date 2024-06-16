import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:projeto/Pages/MorePage/MorePage.dart';
import 'package:projeto/Pages/ChatPage/ChatPage.dart';
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
    
      bottomNavigationBar:  Padding(
        padding:EdgeInsets.only(bottom: 10.0),
        child: DotNavigationBar(
          
          
            // margin: const EdgeInsets.symmetric(horizontal: 20),
            duration: const Duration(milliseconds: 800),
            backgroundColor: Colors.black,
            margin: EdgeInsets.only(left: 20.0,right: 20.0),
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.calendar_today_rounded),
                selectedColor: ColorsPaleta().red,
                unselectedColor: Colors.black,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.people_alt_outlined),
                selectedColor: ColorsPaleta().red,
                unselectedColor: Colors.black,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.chat_bubble_outline_rounded),
                selectedColor: ColorsPaleta().red,
                unselectedColor: Colors.black,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.menu_sharp),
                selectedColor: ColorsPaleta().red,
                unselectedColor: Colors.black,
              ),
            ],
            onTap: onTap,
            currentIndex: indexCurrent,
            // splashBorderRadius: 50,
          ),
      ),
      
      // body: _widgetOptions.elementAt(indexCurrent),
    );
  }

  final List<Widget> _widgetOptions = <Widget>[
    const MainEventoPage(),
    const MainTimePage(),
    const ChatPage(),
    const MorePage()
  ];
}
