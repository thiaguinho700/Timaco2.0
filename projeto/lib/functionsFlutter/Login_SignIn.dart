import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto/utils/ScankBarErrorHandler.dart';
import "package:cloud_firestore/cloud_firestore.dart";

Future createUserWithEmailPass(String emailUser, String passwordUser,
    String nameUser, bool isEmailValidBool, BuildContext context) async {
  final docRef = FirebaseFirestore.instance.collection("user_data_register");
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailUser, password: passwordUser)
        .then((value) async {
      final json = {
        "UserUID": value.user!.uid,
        "UserName": nameUser,
        "EmailUser": emailUser,
      };
      await docRef.add(json);
    });
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "email-already-in-use":
        handleSnackBar(
            context, "Email já está em uso!\nPor favor, tente novamente.");
        break;
    }
  } catch (e) {
    print(e);
  }
}

Future<void> signInUser(String emailUser, String passwordUser,
    Widget goingToPage, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailUser, password: passwordUser);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => goingToPage));
  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code.toString()) {
      case "invalid-credential":
        handleSnackBar(
            context, "Usuário não encontrado!\nPor favor, tente novamente.");
        break;
    }
  } catch (e) {
    print(e);
  }
}

Future<void> signInUserGoogleAccount(String emailUser, String passwordUser,
    Widget goingToPage, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailUser, password: passwordUser);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => goingToPage));
  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code.toString()) {
      case "invalid-credential":
        handleSnackBar(
            context, "Usuário não encontrado!\nPor favor, tente novamente.");
        break;
    }
  } catch (e) {
    print(e);
  }
}

Future signOutUser(Widget goingToPage, BuildContext context) async {
  final googleSignInVar = GoogleSignIn();
  final firebaseAuth = FirebaseAuth.instance;
  try {
    await googleSignInVar.signOut();
    await firebaseAuth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => goingToPage));
  } catch (e) {
    print(e);
  }
}
