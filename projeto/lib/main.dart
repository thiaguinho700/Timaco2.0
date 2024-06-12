import 'package:projeto/Pages/ChatPage/MainChatPage.dart';
import 'package:projeto/Pages/LoadingPage/LoadingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Pages/LoginPage/LoginPage.dart';
import 'package:projeto/Pages/MainTImesPage/CreateNewTime.dart';
import 'package:projeto/Pages/MainTImesPage/MainTImesPage.dart';
import 'package:projeto/Pages/SignInPage/SignInPage.dart';
import 'package:projeto/Pages/MainEventoPage/MainEventoPage.dart';
import 'package:projeto/utils/BottomNavBar.dart';

void  main() {
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
