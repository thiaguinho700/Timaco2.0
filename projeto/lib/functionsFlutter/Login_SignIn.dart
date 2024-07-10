import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:projeto/utils/ScankBarErrorHandler.dart';

Future createUserWithEmailPass(
  String emailUser,
  String passwordUser,
  String nameUser,
  bool isEmailValidBool,
  BuildContext context,
  Widget goingToPage,
) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailUser, password: passwordUser)
        .then((value) async {
          
      final json = {
        "UserUID": value.user!.uid,
        "NomeSobrenomeUser": nameUser,
        "EmailUser": emailUser,
        "PhotoImage": "",
        "AboutUser": "",
        "ListTimeID": [{}],
      };

      await FirebaseFirestore.instance
          .collection("user_data_register")
          .doc(value.user!.uid)
          .update(json);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goingToPage));
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

Future sendVerificationEmail(BuildContext context) async {
  try {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    handleSnackBarSuccess(context, "Verificação de email enviada!");
  } catch (e) {
    handleSnackBar(context, "Erro ao enviar email de\nverificação");
  }
}

Future<void> signInUser(String emailUser, String passwordUser,
    Widget goingToPage, BuildContext context) async {
  final Timer timer;
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailUser, password: passwordUser);

    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => goingToPage));
      } else {
        // sendVerificationEmail(context);
      }
    });
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

Future<void> signInUserGoogleAccount(
    Widget goingToPage, BuildContext context) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
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

Future forgetPassword(BuildContext context, String emailText) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailText);
    handleSnackBarSuccess(context, "Email de resetar senha enviado.");
  } on FirebaseAuthException catch (e) {
    print(e.code);
    handleSnackBar(context, e.message.toString());
  } catch (e) {
    print(e);
  }
}
