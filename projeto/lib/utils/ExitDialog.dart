import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:projeto/Pages/LoginPage/LoginPage.dart';
import 'package:projeto/functionsFlutter/Login_SignIn.dart' show signOutUser;

class ExitDialog extends StatefulWidget {
  const ExitDialog({super.key});

  @override
  State<ExitDialog> createState() => _ExitDialogState();
}

class _ExitDialogState extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AlertDialog(
        content: SizedBox(
          width: 500,
          height: 130,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirmar",
                  style:
                      TextStyle(fontSize: 21.0, color: ColorsPaleta().orange),
                ),
                const Text(
                  "Deseja sair da conta?",
                  style: TextStyle(fontSize: 19.0, color: Colors.black),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(fontSize: 19.0),
                        )),
                    GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const LoginPage()));
                          signOutUser(LoginPage(), context);
                        },
                        child: const Text("Sair",
                            style: TextStyle(fontSize: 19.0)))
                  ],
                )
              ]),
        ),
      ),
    ]);
  }
}
