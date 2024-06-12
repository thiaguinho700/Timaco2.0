import 'package:flutter/material.dart';

import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:projeto/utils/ExitDialog.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePage();
}

class _MorePage extends State<MorePage> {
  ExitDialogFun() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ExitDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(children: [
            Stack(
              alignment: Alignment.centerRight,
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(55.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 1.5),
                          blurRadius: 2,
                        )
                      ],
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 0.3, color: ColorsPaleta().orange)),
                  child: const Text(
                    "U",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 33.0),
                  ),
                ),
                Positioned(
                  right: 120,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1.5),
                              blurRadius: 4)
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.8, color: ColorsPaleta().orange)),
                    child: const Icon(
                      Icons.photo_camera,
                      size: 30.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Positioned(
                  left: 120,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(0, 1.5))
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.8, color: ColorsPaleta().orange)),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Usuário",
              selectionColor: ColorsPaleta().subTextMainColor,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 11.0),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          backgroundColor:
                              const Color.fromARGB(255, 235, 235, 235)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const SizedBox(width: 18.0),
                          Icon(
                            Icons.flip_camera_android_rounded,
                            color: ColorsPaleta().orange,
                            size: 30.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Mudar de conta",
                            style: TextStyle(
                                color: ColorsPaleta().orange, fontSize: 22.0),
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 11.0),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            backgroundColor:
                                const Color.fromARGB(255, 235, 235, 235)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            const SizedBox(width: 18.0),
                            Icon(
                              Icons.person_outlined,
                              color: ColorsPaleta().orange,
                              size: 30.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text("Perfil",
                                style: TextStyle(
                                    color: ColorsPaleta().orange,
                                    fontSize: 22.0))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 11.0),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            backgroundColor:
                                const Color.fromARGB(255, 235, 235, 235)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            const SizedBox(width: 18.0),
                            Icon(
                              Icons.settings,
                              color: ColorsPaleta().orange,
                              size: 30.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text("Configurações",
                                style: TextStyle(
                                    color: ColorsPaleta().orange,
                                    fontSize: 22.0))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 11.0),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            backgroundColor:
                                const Color.fromARGB(255, 235, 235, 235)),
                        onPressed: () {
                          ExitDialogFun();
                        },
                        child: const Row(
                          children: [
                            SizedBox(width: 18.0),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 30.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Sair",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 22.0)),
                          ],
                        )),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
