import 'package:firebase_core/firebase_core.dart';
import 'package:projeto/Pages/LoginPage/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto/utils/BottomNavBar.dart';
import 'package:projeto/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthCheck(),
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return BottomNavBar();
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const CircularProgressIndicator();
        // } else if (snapshot.hasData) {
        //   return const BottomNavBar();
        // } else {
        //   return const LoginPage();
        // }
      },
    );
  }
}
