import 'package:projeto/Pages/ChatPage/MainChatPage.dart';
import 'package:projeto/Pages/LoadingPage/LoadingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:codigo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto/Pages/LoginPage/LoginPage.dart';
import 'package:projeto/utils/BottomNavBar.dart';
import 'package:projeto/firebase_options.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
